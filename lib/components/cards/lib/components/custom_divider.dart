import "package:flutter/material.dart";

import "../../../../theme/theme_saks.dart";

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? ThemeSAKS.colors.grayscale.division,
      thickness: 1,
      height: 1,
    );
  }
}
