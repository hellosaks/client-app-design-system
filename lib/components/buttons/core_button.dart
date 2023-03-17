import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

class CoreButton extends StatelessWidget {
  final String text;
  final Color color;

  final bool underline;
  final bool strikethrough;
  final bool endIcon;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  const CoreButton({
    super.key,
    required this.text,
    required this.color,
    this.endIcon = false,
    this.underline = false,
    this.strikethrough = false,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Mix(
      bgColor(Colors.transparent),
      mainAxisSize(MainAxisSize.min),
    );
    return Box(
      mix: styles,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 20,
          ),
          Box(
            child: HBox(
              children: [
                if (leftIcon != null) ...[
                  _buildLeftIcon(),
                  const SizedBox(width: 11),
                ],
                _buildLabel(),
                if (rightIcon != null) ...[
                  const SizedBox(width: 11),
                  _buildRightIcon()
                ],
              ],
            ),
          ),
          _buildEndIcon()
        ],
      ),
    );
  }

  Widget _buildEndIcon() {
    if (endIcon) {
      return Icon(
        key: const Key("end-icon"),
        props: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.check,
            color: color,
          ),
        ),
      );
    }

    return const SizedBox(
      width: 20,
    );
  }

  Widget _buildLabel() {
    TypographyVariant variant = TypographyVariant.h6;

    if (underline == true) {
      variant = TypographyVariant.underline;
    }

    if (strikethrough == true) {
      variant = TypographyVariant.strikethrough;
    }

    return CustomTypography(
      weight: FontWeight.w700,
      variant: variant,
      color: color,
      text: text,
    );
  }

  IconProps get iconProps {
    final IconVariant iconVariant =
        leftIcon != null ? leftIcon!.variant : rightIcon!.variant;

    const double size = 24;

    switch (iconVariant) {
      case IconVariant.heroicons:
        final HeroIconsProps heroIconProps = leftIcon != null
            ? leftIcon!.heroIconsProps!
            : rightIcon!.heroIconsProps!;

        heroIconProps.color = color;
        heroIconProps.size = size;
        return IconProps(variant: iconVariant, heroIconsProps: heroIconProps);

      case IconVariant.unicons:
        final UniconsProps uniconsProps = leftIcon != null
            ? leftIcon!.uniconsProps!
            : rightIcon!.uniconsProps!;

        uniconsProps.color = color;
        uniconsProps.size = size;

        return IconProps(variant: iconVariant, uniconsProps: uniconsProps);
      case IconVariant.custom:
        final CustomIconsProps customIconsProps = leftIcon != null
            ? leftIcon!.customIconsProps!
            : rightIcon!.customIconsProps!;

        customIconsProps.color = color;
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
