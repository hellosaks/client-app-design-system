import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:client_app_design_system/components/buttons/core_button.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

@docWidget
class SecondaryButton extends StatefulWidget {
  final String text;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool disable;
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
    this.disable = false,
    this.selected = false,
    this.outlined = false,
  })  : assert(
          !(leftIcon != null && rightIcon != null),
          "only direction can be used",
        ),
        assert(
          !((leftIcon != null || rightIcon != null) && selected == true),
          "only direction can be used",
        ),
        assert(
          !(outlined == true && colorAttributes == null),
          "you nedd pass color attributes",
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
        if (widget.disable == false) {
          setState(() {
            currentColor = _pressUpColor;
            pressed = false;
          });
          widget.onPressed.call();
        }

        return;
      },
      onTapCancel: () {
        if (widget.disable == false) {
          setState(() {
            currentColor = _pressDownColor;
            pressed = true;
          });
        }
      },
      onTapDown: (_) {
        if (widget.disable == false) {
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
      mainAxis(MainAxisAlignment.center),
      rounded(ThemeSAKS.shape.borderRadius),
      height(36),
      crossAxis(CrossAxisAlignment.center),
      width(315),
      paddingHorizontal(15),
      opacity(widget.disable == true ? 0.5 : 1),
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
        borderColor(ThemeSAKS.colors.grayscale.division),
      ),
    );

    return Box(
      key: SecondaryButton.boxContainerKey,
      mix: widget.outlined ? stylesOutlined : stylesFilled,
      child: CoreButton(
        leftIcon: widget.leftIcon,
        rightIcon: widget.rightIcon,
        text: widget.text,
        endIcon: widget.selected,
        color: () {
          if (widget.outlined == true) {
            if (pressed == true) {
              return _pressDownColor;
            }
            return _insideColor;
          }

          return _insideColor;
        }(),
      ),
    );
  }
}
