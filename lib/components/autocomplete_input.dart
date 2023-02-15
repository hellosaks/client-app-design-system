import "dart:async";

import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/theme/theme_saks.dart";
import "package:client_app_design_system/utils/dto.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:flutter/material.dart";
import "package:mix/mix.dart";

// TODO add tests for this widget
class AutoCompleteInput<T extends Object> extends StatefulWidget {
  const AutoCompleteInput({
    Key? key,
    required this.optionsBuilder,
    required this.onSelected,
    required this.input,
    required this.noOptionsText,
    required this.initLabel,
    this.value,
    this.debounceDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  final Future<Iterable<DropdownValue<T>>> Function(String) optionsBuilder;
  final Duration debounceDuration;
  final String noOptionsText;
  final String initLabel;
  final T? value;
  final void Function(DropdownValue<T>) onSelected;

  final Widget Function(
    bool,
    TextEditingController,
    FocusNode,
    DropdownValue<T>?,
  ) input;

  @override
  State<AutoCompleteInput<T>> createState() => _AutoCompleteInputState<T>();
}

class _AutoCompleteInputState<T extends Object>
    extends State<AutoCompleteInput<T>> {
  bool loading = false;
  bool firstLoading = true;
  bool showOverlayAfterValue = false;
  DropdownValue<T>? selected;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  Iterable<DropdownValue<T>> listOptions = [];
  Timer? _debouncer;
  String textInput = "";
  OverlayEntry? entry;
  final LayerLink layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return widget.input(
            loading,
            textEditingController,
            focusNode,
            selected,
          );
        },
      ),
    );
  }

  void debounceInput(String value) {
    _debouncer?.cancel();
    _debouncer = Timer(widget.debounceDuration, () async {
      if (value != textInput) {
        hideOverlay();

        setState(() {
          textInput = value;
          loading = true;
        });

        final Iterable<DropdownValue<T>> response =
            await widget.optionsBuilder(value);

        setState(() {
          listOptions = response;
          loading = false;
          firstLoading = false;
        });

        // show overlay if hasFocus and not opened overlay before
        if (focusNode.hasFocus && entry == null) {
          showOverlay();
        }
      }
    });
  }

  Future<void> makeValueSelected() async {
    final options = await widget.optionsBuilder("");

    setState(() {
      listOptions = options;
    });

    final finded =
        listOptions.where((element) => element.value == widget.value);
    final findedSelected = finded.length == 1 ? finded.elementAt(0) : null;

    if (findedSelected != null) {
      textEditingController.text = findedSelected.label;

      setState(() {
        selected = findedSelected;
        showOverlayAfterValue = true;
      });
    }
  }

  @override
  void didUpdateWidget(AutoCompleteInput<T> oldWidget) {
    // didUpdateWidget for when value property changes
    if (widget.value == null) {
      // return to the initial state of the field when the value is null
      selected = null;
      listOptions = [];
      _debouncer = null;
      textInput = "";
      firstLoading = true;
      hideOverlay();
      // attach a new eventListener to the new textEditingController reference
      textEditingController = TextEditingController();
      attachTextListener();
    }

    performeShowInitialValue();

    super.didUpdateWidget(oldWidget);
  }

  /// shows the text in the textInput for an initial value other than null
  void performeShowInitialValue() {
    // showOverlayAfterValue is a flag to show the overlay
    // only after changing the textInput value
    showOverlayAfterValue = widget.value == null;

    if (widget.value != null) {
      // show initialValue selected in input
      makeValueSelected();
    }
  }

  void attachTextListener() {
    // every input change
    textEditingController.addListener(() {
      if (textEditingController.text != "" && showOverlayAfterValue == true) {
        debounceInput(textEditingController.text);
      }
    });
  }

  @override
  void initState() {
    performeShowInitialValue();

    attachTextListener();

    focusNode.addListener(() {
      if (selected != null) {
        _updateInput(selected!.label);
      }
      if (focusNode.hasFocus == false) {
        hideOverlay();

        // clear input if not option selected
        if (selected == null) {
          textEditingController.text = "";
        }
      } else {
        showOverlay();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    hideOverlay();
    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final size = renderBox!.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: _overlayEntry(),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void _updateInput(String label) {
    setState(() => textInput = label);
    textEditingController.text = label;
  }

  Widget _overlayEntry() {
    final style = Mix(
      h(listOptions.isEmpty ? 50 : listOptions.length * 50),
      maxH(200),
      w(double.infinity),
      elevation(12),
    );

    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        child: Box(
          mix: style,
          child: listOptions.isEmpty
              ? _buildOption(
                  firstLoading ? widget.initLabel : widget.noOptionsText,
                  null,
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: listOptions.length,
                  itemExtent: 50,
                  itemBuilder: (BuildContext context, int index) {
                    final option = listOptions.elementAt(index);

                    return GestureDetector(
                      onTap: () {
                        widget.onSelected(option);

                        setState(() => selected = option);

                        // change input controller after selected
                        _updateInput(option.label);

                        // hide options after selected
                        hideOverlay();
                        // remove focus after selected
                        focusNode.unfocus();
                      },
                      child: _buildOption(option.label, option.value),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildOption(String label, T? value) {
    final style = Mix(
      bgColor(
        value == null
            ? Colors.white
            : selected?.value == value
                ? ThemeSAKS.colors.blackTone.colorBlack02
                : Colors.white,
      ),
      px(22),
      py(13),
    );
    final styleText = Mix(textOverflow(TextOverflow.ellipsis));

    return Box(
      mix: style,
      child: CustomTypography(
        variant: TypographyVariant.h3,
        text: label,
        color: value == null
            ? ThemeSAKS.colors.blackTone.colorBlack02
            : selected?.value == value
                ? Colors.white
                : ThemeSAKS.colors.blackTone.colorBlack02,
        mix: styleText,
      ),
    );
  }
}
