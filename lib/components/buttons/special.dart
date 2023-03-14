import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

@docWidget
class SpecialButton extends StatefulWidget {
  final String label;
  final void Function() onPressed;
  final SpecialButtonVariant variant;
  final bool disabled;

  const SpecialButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.variant,
    this.disabled = false,
  });

  static const Key boxContainerKey = Key("boxContainerKey");

  @override
  State<SpecialButton> createState() => _SpecialButtonState();
}

class _SpecialButtonState extends State<SpecialButton> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled ? null : widget.onPressed,
      onTapUp: widget.disabled ? null : (_) => setState(() => tapped = false),
      onTapDown: widget.disabled ? null : (_) => setState(() => tapped = true),
      child: widget.variant == SpecialButtonVariant.whatsapp
          ? AnimatedOpacity(
              opacity: tapped ? 0.8 : 1,
              duration: const Duration(milliseconds: 125),
              child: _buildButton(),
            )
          : _buildButton(),
    );
  }

  Widget _buildButton() {
    final style = Mix(
      bgColor(backgroundColor),
      px(28),
      py(16),
      rounded(NewThemeSAKS.shape.borderRadiusSpecialButton),
      widget.disabled ? opacity(0.5) : null,
      animated(),
    );
    final styleHbox = Mix(mainAxisSize(MainAxisSize.min));

    return Box(
      key: SpecialButton.boxContainerKey,
      mix: style,
      child: HBox(
        mix: styleHbox,
        children: [
          Icon(
            props: IconProps(
              variant: IconVariant.custom,
              customIconsProps: CustomIconsProps(
                icon: icon,
                color: NewThemeSAKS.colors.grayscale.snow,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 10),
          CustomTypography(
            variant: TypographyVariant.h7,
            text: widget.label,
            weight: FontWeight.w600,
            color: NewThemeSAKS.colors.grayscale.snow,
          ),
        ],
      ),
    );
  }

  Color get backgroundColor {
    switch (widget.variant) {
      case SpecialButtonVariant.whatsapp:
        return NewThemeSAKS.colors.utility.conservative;
      case SpecialButtonVariant.share:
        if (tapped) {
          return NewThemeSAKS.colors.secondary.stone;
        }
        return NewThemeSAKS.colors.primary.sea;
    }
  }

  CustomIcons get icon {
    switch (widget.variant) {
      case SpecialButtonVariant.whatsapp:
        return CustomIcons.icWhatsapp;
      case SpecialButtonVariant.share:
        return CustomIcons.icShare;
    }
  }
}
