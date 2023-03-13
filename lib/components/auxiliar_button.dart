import "package:client_app_design_system/components/custom_typography.dart";
import "package:client_app_design_system/theme/theme_saks.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";
import "package:mix/mix.dart";

@docWidget
class AuxiliarButton extends StatelessWidget {
  final void Function() onPressed;
  final bool disabled;
  final String label;

  const AuxiliarButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      rounded(NewThemeSAKS.shape.borderRadius),
      bgColor(NewThemeSAKS.colors.primary.saks),
      animated(),
    );
    final stylePressed = Mix(
      press(bgColor(NewThemeSAKS.colors.secondary.bay)),
    );
    final styleDisabled = Mix(opacity(0.5));

    return Pressable(
      mix: Mix.combine(style, disabled ? styleDisabled : stylePressed),
      onPressed: disabled ? null : onPressed,
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    final style = Mix(px(12), py(7));

    return Box(
      mix: style,
      child: CustomTypography(
        text: label,
        variant: TypographyVariant.h7,
        weight: FontWeight.w700,
        color: NewThemeSAKS.colors.grayscale.snow,
      ),
    );
  }
}
