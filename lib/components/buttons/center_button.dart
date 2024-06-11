import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;


@docWidget
class CenterButton extends StatefulWidget {
  final bool disabled;
  final IconData icon;
  final void Function() onPressed;
  final ColorAttributesButton? colorAttributes;

  static const Key boxContainerKey = Key("box-container");

  const CenterButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.colorAttributes,
    this.disabled = false,
  });

  @override
  State<CenterButton> createState() => _CenterButtonState();
}

class _CenterButtonState extends State<CenterButton> {
  bool tapped = false;

  Color? get _pressDownColor {
    return widget.colorAttributes?.pressColor;
  }

  Color? get _insideColor {
    return widget.colorAttributes?.insideColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: widget.disabled
          ? Colors.transparent
          : OldThemeSAKS.colors.grayTone.colorGray13,
      focusColor: widget.disabled
          ? Colors.transparent
          : OldThemeSAKS.colors.grayTone.colorGray13,
      splashColor: widget.disabled
          ? Colors.transparent
          : OldThemeSAKS.colors.grayTone.colorGray13,
      hoverColor: widget.disabled
          ? Colors.transparent
          : OldThemeSAKS.colors.grayTone.colorGray13,
      canRequestFocus: widget.disabled == false,
      enableFeedback: widget.disabled == false,
      borderRadius: BorderRadius.circular(30),
      onTapUp: (_) {
        if (widget.disabled == false) {
          setState(() {
            tapped = false;
          });
          widget.onPressed.call();
        }

        return;
      },
      onTapCancel: () {
        if (widget.disabled == false) {
          setState(() {
            tapped = true;
          });
        }
      },
      onTapDown: (_) {
        if (widget.disabled == false) {
          setState(() {
            tapped = true;
          });
        }
      },
      child: _buildContent(),
    );
  }

  Color getBackgroundColor() {
    if (widget.colorAttributes?.bgColor != Colors.transparent) {
      return tapped == false
          ? widget.colorAttributes!.bgColor
          : _pressDownColor!;
    }
    return Colors.transparent;
  }

  Widget _buildContent() {
    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: Container(
        key: CenterButton.boxContainerKey,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: getBackgroundColor(),
        ),
        child: Icon(
          props: IconProps(
            uniconsProps: UniconsProps(
              icon: widget.icon,
              size: 40,
              color: tapped == true &&
                      widget.colorAttributes?.bgColor == Colors.transparent
                  ? _pressDownColor
                  : _insideColor,
            ),
            variant: IconVariant.unicons,
          ),
        ),
      ),
    );
  }
}
