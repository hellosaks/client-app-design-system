import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:client_app_design_system/components/buttons/core_button.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

/// ```dart
/// final button =  TertiaryButton(
///   text: 'Button',
///  onPressed: () {}
///  );
/// ```
@docWidget
class TertiaryButton extends StatefulWidget {
  final String text;
  final bool underline;
  final bool strikethrough;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool disable;
  final void Function() onPressed;

  final ColorAttributesButton? colorAttributes;

  const TertiaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorAttributes,
    this.leftIcon,
    this.rightIcon,
    this.disable = false,
    this.underline = false,
    this.strikethrough = false,
  })  : assert(
          !(leftIcon != null && rightIcon != null),
          "only one direction can be used",
        ),
        assert(
          !(underline == true && strikethrough == true),
          "only one font style can be used",
        );

  @override
  State<TertiaryButton> createState() => _TertiaryButtonState();
}

class _TertiaryButtonState extends State<TertiaryButton> {
  final defaultColorAttribures = ColorAttributesButton(
    insideColor: ThemeSAKS.colors.primary.saks,
    pressColor: ThemeSAKS.colors.secondary.bay,
  );

  Color? currentColor;

  Color get _pressUpColor {
    return widget.colorAttributes?.bgColor ?? defaultColorAttribures.bgColor;
  }

  Color get _pressDownColor {
    return widget.colorAttributes?.pressColor ??
        defaultColorAttribures.pressColor;
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      currentColor = widget.colorAttributes?.insideColor ??
          defaultColorAttribures.insideColor;
    });
  }

  Color get _insideColor {
    return widget.colorAttributes?.insideColor ??
        defaultColorAttribures.insideColor;
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
      child: Opacity(
        opacity: widget.disable == true ? 0.5 : 1,
        child: CoreButton(
          leftIcon: widget.leftIcon,
          rightIcon: widget.rightIcon,
          underline: widget.underline,
          strikethrough: widget.strikethrough,
          text: widget.text,
          color: _insideColor,
        ),
      ),
    );
  }
}
