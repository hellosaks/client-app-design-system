import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

@docWidget
class SecondaryButton extends StatefulWidget {
  final String text;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool disabled;
  final bool selected;
  final bool outlined;
  final void Function() onPressed;

  final ColorAttributesButton? colorAttributes;

  static const Key boxContainerKey = Key("box-container");

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorAttributes,
    this.leftIcon,
    this.rightIcon,
    this.disabled = false,
    this.selected = false,
    this.outlined = false,
  })  : assert(
          !(leftIcon != null && rightIcon != null),
          "only direction can be used",
        ),
        assert(
          !((leftIcon != null || rightIcon != null) && selected == true),
          "selected cannot be used with icon properties",
        ),
        assert(
          !(outlined == true && colorAttributes == null),
          "you need pass color attributes",
        );

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  final defaultColorAttribures = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.primary.saks,
    pressColor: ThemeSAKS.colors.secondary.bay,
  );

  Color? currentColor;
  bool pressed = false;

  Color get _pressUpColor {
    return widget.colorAttributes?.bgColor ?? defaultColorAttribures.bgColor;
  }

  Color get _pressDownColor {
    return widget.colorAttributes?.pressColor ??
        defaultColorAttribures.pressColor;
  }

  Color get _insideColor {
    return widget.colorAttributes?.insideColor ??
        defaultColorAttribures.insideColor;
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      currentColor =
          widget.colorAttributes?.bgColor ?? defaultColorAttribures.bgColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapUp: (_) {
        if (widget.disabled == false) {
          setState(() {
            currentColor = _pressUpColor;
            pressed = false;
          });
          widget.onPressed.call();
        }

        return;
      },
      onTapCancel: () {
        if (widget.disabled == false) {
          setState(() {
            currentColor = _pressDownColor;
            pressed = true;
          });
        }
      },
      onTapDown: (_) {
        if (widget.disabled == false) {
          setState(() {
            currentColor = _pressDownColor;
            pressed = true;
          });
        }
      },
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    final styles = Mix(
      rounded(ThemeSAKS.shape.borderRadius),
      width(double.infinity),
      paddingHorizontal(10),
      paddingVertical(
        (widget.leftIcon != null ||
                widget.rightIcon != null ||
                widget.selected == true)
            ? 6
            : 9,
      ),
      opacity(widget.disabled == true ? 0.5 : 1),
    );

    final stylesFilled = Mix.combine(
      styles,
      Mix(
        bgColor(currentColor!),
      ),
    );

    final stylesOutlined = Mix.combine(
      styles,
      Mix(
        borderWidth(1),
        press(borderColor(_pressDownColor)),
        borderColor(
          widget.colorAttributes?.outsideColor ??
              ThemeSAKS.colors.grayscale.division,
        ),
      ),
    );

    return Box(
      key: SecondaryButton.boxContainerKey,
      mix: widget.outlined ? stylesOutlined : stylesFilled,
      child: CoreButton(
        leftIcon: widget.leftIcon,
        rightIcon: widget.rightIcon,
        text: widget.text,
        checked: widget.selected,
        color: _color,
      ),
    );
  }

  Color get _color {
    if (widget.outlined == true) {
      if (pressed == true) {
        return _pressDownColor;
      }
    }

    return _insideColor;
  }
}
