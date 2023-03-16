import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

class ColorAttributesButton {
  final Color bgColor;
  final Color pressColor;

  ColorAttributesButton({required this.bgColor, required this.pressColor});
}

/// ```dart
/// final button =  ButtonTertiary(
///   text: 'Button',
///  onPressed: () {}
///  );
/// ```
@docWidget
class ButtonTertiary extends StatefulWidget {
  final String text;
  final bool underline;
  final bool strikethrough;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool disable;
  final void Function() onPressed;

  final ColorAttributesButton? colorAttributes;

  const ButtonTertiary({
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
          "only direction can be used",
        ),
        assert(
          !(underline == true && strikethrough == true),
          "only font style type can be used",
        );

  @override
  State<ButtonTertiary> createState() => _ButtonTertiaryState();
}

class _ButtonTertiaryState extends State<ButtonTertiary> {
  final defaultColorAttribures = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.primary.saks,
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
      child: Opacity(
        opacity: widget.disable == true ? 0.5 : 1,
        child: HBox(
          children: [
            if (widget.leftIcon != null) ...[
              _buildLeftIcon(),
              const SizedBox(width: 11),
            ],
            _buildLabel(),
            if (widget.rightIcon != null) ...[
              const SizedBox(width: 11),
              _buildRightIcon()
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildLabel() {
    TypographyVariant variant = TypographyVariant.h6;

    if (widget.underline == true) {
      variant = TypographyVariant.underline;
    }

    if (widget.strikethrough == true) {
      variant = TypographyVariant.strikethrough;
    }

    return CustomTypography(
      weight: FontWeight.w700,
      variant: variant,
      color: currentColor!,
      text: widget.text,
    );
  }

  IconProps get iconProps {
    final IconVariant iconVariant = widget.leftIcon != null
        ? widget.leftIcon!.variant
        : widget.rightIcon!.variant;

    const double size = 24;

    switch (iconVariant) {
      case IconVariant.heroicons:
        final HeroIconsProps heroIconProps = widget.leftIcon != null
            ? widget.leftIcon!.heroIconsProps!
            : widget.rightIcon!.heroIconsProps!;

        heroIconProps.color = currentColor;
        heroIconProps.size = size;
        return IconProps(variant: iconVariant, heroIconsProps: heroIconProps);

      case IconVariant.unicons:
        final UniconsProps uniconsProps = widget.leftIcon != null
            ? widget.leftIcon!.uniconsProps!
            : widget.rightIcon!.uniconsProps!;

        uniconsProps.color = currentColor;
        uniconsProps.size = size;

        return IconProps(variant: iconVariant, uniconsProps: uniconsProps);
      case IconVariant.custom:
        final CustomIconsProps customIconsProps = widget.leftIcon != null
            ? widget.leftIcon!.customIconsProps!
            : widget.rightIcon!.customIconsProps!;

        customIconsProps.color = currentColor;
        customIconsProps.size = size;

        return IconProps(
          variant: iconVariant,
          customIconsProps: customIconsProps,
        );
    }
  }

  Widget _buildLeftIcon() => Icon(props: iconProps);

  Widget _buildRightIcon() => Icon(props: iconProps);
}
