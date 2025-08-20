import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

@docWidget
class PrimaryButton extends StatefulWidget {
  final String text;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool disabled;
  final void Function() onPressed;

  static const Key boxContainerKey = Key("box-container");

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.disabled = false,
  }) : assert(
          !(leftIcon != null && rightIcon != null),
          "only icon direction can be used",
        );

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  // default color is primary
  final defaultColorAttribures = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.primary.sea,
    pressColor: ThemeSAKS.colors.secondary.anchor,
  );

  Color? currentColor;

  Color get _pressUpColor {
    return defaultColorAttribures.bgColor;
  }

  Color get _pressDownColor {
    return defaultColorAttribures.pressColor;
  }

  Color get _insideColor {
    return defaultColorAttribures.insideColor;
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      currentColor = defaultColorAttribures.bgColor;
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
          });
          widget.onPressed.call();
        }

        return;
      },
      onTapCancel: () {
        if (widget.disabled == false) {
          setState(() {
            currentColor = _pressDownColor;
          });
        }
      },
      onTapDown: (_) {
        if (widget.disabled == false) {
          setState(() {
            currentColor = _pressDownColor;
          });
        }
      },
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      key: PrimaryButton.boxContainerKey,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical:
            (widget.leftIcon != null || widget.rightIcon != null) ? 9 : 12.5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeSAKS.shape.borderRadius),
        color: (widget.disabled == true)
            ? currentColor!.withOpacity(0.5)
            : currentColor,
      ),
      child: CoreButton(
        cta: true,
        leftIcon: widget.leftIcon,
        rightIcon: widget.rightIcon,
        text: widget.text,
        color: _insideColor,
      ),
    );
  }
}
