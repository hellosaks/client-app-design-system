import "package:client_app_design_system/theme/theme_saks.dart";
import "package:flutter/material.dart";

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? ThemeSAKS.colors.grayscale.division,
      thickness: 1,
      height: 1,
    );
  }
}
