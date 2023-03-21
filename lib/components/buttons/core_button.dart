import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/util_functions.dart";
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

  static double sizeIcon = 14;

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
    );

    return Box(
      mix: styles,
      child: Row(
        mainAxisAlignment:
            checked ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          if (checked)
            const SizedBox(
              width: 20,
            ),
          _buildContent(),
          if (checked) _buildCheckedIcon()
        ],
      ),
    );
  }

  Widget _buildContent() {
    final HBox content = HBox(
      children: [
        if (leftIcon != null) ...[
          _buildLeftIcon(),
          const SizedBox(width: 5),
        ],
        _buildLabel(),
        if (rightIcon != null) ...[const SizedBox(width: 5), _buildRightIcon()],
      ],
    );

    return Box(
      child: content,
    );
  }

  Widget _buildCheckedIcon() {
    return _buildBoxIcon(
      size: 24,
      child: Icon(
        key: const Key("end-icon"),
        props: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.check,
            color: color,
            // size: 16,
          ),
        ),
      ),
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

  Widget _buildBoxIcon({required Widget child, double size = 20}) {
    return SizedBox(
      width: size,
      height: size,
      child: child,
    );
  }

  Widget _buildLeftIcon() => _buildBoxIcon(
        child: Icon(
          props: iconProps(
            variant: leftIcon!.variant,
            props: leftIcon!,
            color: color,
            size: sizeIcon,
          ),
        ),
      );

  Widget _buildRightIcon() => _buildBoxIcon(
        child: Icon(
          props: iconProps(
            variant: rightIcon!.variant,
            props: rightIcon!,
            color: color,
            size: sizeIcon,
          ),
        ),
      );
}
