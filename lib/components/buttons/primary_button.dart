import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:client_app_design_system/components/buttons/core_button.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

@docWidget
class PrimaryButton extends StatefulWidget {
  final String text;
  final bool underline;
  final bool strikethrough;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool disable;
  final void Function() onPressed;

  final ColorAttributesButton? colorAttributes;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorAttributes,
    this.leftIcon,
    this.rightIcon,
    this.disable = false,
    this.underline = false,
    this.strikethrough = false,
  })  : assert(!(leftIcon != null && rightIcon != null),
            "only direction can be used",),
        assert(!(underline == true && strikethrough == true),
            "only font style type can be used",);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  // default color is primary
  final defaultColorAttribures = ColorAttributesButton(
      bgColor: ThemeSAKS.colors.primary.saks,
      pressColor: ThemeSAKS.colors.secondary.bay,);

  Color? currentColor;

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
          });
          widget.onPressed.call();
        }

        return;
      },
      onTapCancel: () {
        if (widget.disable == false) {
          setState(() {
            currentColor = _pressDownColor;
          });
        }
      },
      onTapDown: (_) {
        if (widget.disable == false) {
          setState(() {
            currentColor = _pressDownColor;
          });
        }
      },
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    final styles = Mix(
      bgColor(
        currentColor!,
      ),
      mainAxis(MainAxisAlignment.center),
      rounded(ThemeSAKS.shape.borderRadius),
      height(42),
      crossAxis(CrossAxisAlignment.center),
      width(335),
      opacity(widget.disable == true ? 0.5 : 1),
      paddingVertical(5),
      paddingHorizontal(15),
    );

    return Box(
      mix: styles,
      child: CoreButton(
        leftIcon: widget.leftIcon,
        rightIcon: widget.rightIcon,
        text: widget.text,
        color: _insideColor,
      ),
    );
  }
}
