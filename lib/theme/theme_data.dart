import "package:client_app_design_system/theme/theme_saks.dart";
import "package:flutter/material.dart";

ThemeData createTheme(BuildContext context) {
  return ThemeData(
    textTheme: NewThemeSAKS.typography.fontPlusJakartaTextTheme(
      Theme.of(context).textTheme,
    ),
    primaryColor: NewThemeSAKS.colors.primary.saks,
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: NewThemeSAKS.colors.primary.saks,
          secondary: NewThemeSAKS.colors.secondary.bay,
        ),
  );
}

ThemeData createThemeOld(BuildContext context) {
  return ThemeData(
    textTheme: ThemeSAKS.typography.fontPlusJakartaTextTheme(
      Theme.of(context).textTheme,
    ),
    primaryColor: ThemeSAKS.colors.primary,
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: ThemeSAKS.colors.primary,
          secondary: ThemeSAKS.colors.secondary,
        ),
  );
}
