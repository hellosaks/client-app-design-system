import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/icon_props.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

class CoreButton extends StatelessWidget {
  final String text;
  final Color color;

  final bool underline;
  final bool strikethrough;
  final bool checked;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  const CoreButton({
    super.key,
    required this.text,
    required this.color,
    this.checked = false,
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
                  const SizedBox(width: 10),
                ],
                _buildLabel(),
                if (rightIcon != null) ...[
                  const SizedBox(width: 10),
                  _buildRightIcon()
                ],
              ],
            ),
          ),
          _buildCheckedcon()
        ],
      ),
    );
  }

  Widget _buildCheckedcon() {
    if (checked) {
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

  Widget _buildLeftIcon() => Icon(
        props: iconProps(
          variant: leftIcon!.variant,
          props: leftIcon?.customIconsProps ??
              leftIcon?.heroIconsProps ??
              leftIcon?.uniconsProps,
          color: color,
        ),
      );

  Widget _buildRightIcon() => Icon(
        props: iconProps(
          variant: rightIcon!.variant,
          props: rightIcon?.customIconsProps ??
              rightIcon?.heroIconsProps ??
              rightIcon?.uniconsProps,
          color: color,
        ),
      );
}
