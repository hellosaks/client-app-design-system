import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";

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
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return ThemeSAKS.colors.secondary.bay;
            } else if (states.contains(MaterialState.disabled)) {
              return ThemeSAKS.colors.primary.saks.withOpacity(0.5);
            }
            return ThemeSAKS.colors.primary.saks;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeSAKS.shape.borderRadius),
          ),
        ),
        animationDuration: Duration(milliseconds: 100),
      ),
      onPressed: disabled ? null : onPressed,
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: CustomTypography(
        text: label,
        variant: TypographyVariant.h7,
        weight: FontWeight.w700,
        color: ThemeSAKS.colors.grayscale.snow,
      ),
    );
  }
}
