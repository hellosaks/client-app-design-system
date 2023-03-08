import "package:client_app_design_system/theme/theme_saks.dart";
import "package:flutter/material.dart";

ThemeData createTheme(BuildContext context) {
  return ThemeData(
    textTheme: ThemeSAKS.typography.fontMontserratTextTheme(
      Theme.of(context).textTheme,
    ),
    primaryColor: ThemeSAKS.colors.primary.saks,
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: ThemeSAKS.colors.primary.saks,
          secondary: ThemeSAKS.colors.secondary.bay,
        ),
  );
}
