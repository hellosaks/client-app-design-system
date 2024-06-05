import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;

class CoreButton extends StatelessWidget {
  final String text;
  final Color color;

  final bool underline;
  final bool strikethrough;
  final bool checked;
  final bool cta;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  static Key keyIconBox = const Key("icon-box");
  static Key keyEndIcon = const Key("end-icon");
  static Key keyContent = const Key("content-elements");

  const CoreButton({
    super.key,
    required this.text,
    required this.color,
    this.checked = false,
    this.underline = false,
    this.strikethrough = false,
    this.cta = false,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Row(
        key: keyContent,
        mainAxisSize: MainAxisSize.min,
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
    final Row content = Row(
      children: [
        if (leftIcon != null) ...[
          _buildLeftIcon(),
          const SizedBox(width: 5),
        ],
        _buildLabel(),
        if (rightIcon != null) ...[const SizedBox(width: 5), _buildRightIcon()],
      ],
    );

    return Container(
      child: content,
    );
  }

  Widget _buildCheckedIcon() {
    return _buildBoxIcon(
      child: Icon(
        key: keyEndIcon,
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

    if (cta == true) {
      variant = TypographyVariant.cta;
    }

    return CustomTypography(
      weight: FontWeight.w700,
      variant: variant,
      color: color,
      text: text,
    );
  }

  Widget _buildBoxIcon({required Widget child, double size = 24}) {
    return SizedBox(
      key: CoreButton.keyIconBox,
      width: size,
      height: size,
      child: child,
    );
  }

  Widget _buildLeftIcon() =>
      _buildBoxIcon(child: Icon(props: leftIcon!.copyWith(color: color)));

  Widget _buildRightIcon() =>
      _buildBoxIcon(child: Icon(props: rightIcon!.copyWith(color: color)));
}
