import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Typography;

class Selectable extends StatelessWidget {
  final TypographyVariant variant;
  final String text;

  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;

  const Selectable({
    super.key,
    required this.variant,
    required this.text,
    this.weight = FontWeight.w400,
    this.color = Colors.black,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    final styleText =
        _getFontVariant().copyWith(color: color, fontWeight: weight);

    return SelectableText(
      variant == TypographyVariant.cta ? text.toUpperCase() : text,
      style: styleText,
      textAlign: align,
      textScaleFactor: ThemeSAKS.typography.textScaleFactor,
    );
  }

  TextStyle _getFontVariant() {
    switch (variant) {
      case TypographyVariant.h1:
        return ThemeSAKS.typography.h1TypoF;
      case TypographyVariant.h2:
        return ThemeSAKS.typography.h2TypoF;
      case TypographyVariant.h3:
        return ThemeSAKS.typography.h3TypoF;
      case TypographyVariant.h4:
        return ThemeSAKS.typography.h4TypoF;
      case TypographyVariant.h5:
        return ThemeSAKS.typography.h5TypoF;
      case TypographyVariant.h6:
        return ThemeSAKS.typography.h6TypoF;
      case TypographyVariant.h7:
        return ThemeSAKS.typography.h7TypoF;
      case TypographyVariant.cta:
        return ThemeSAKS.typography.ctaTypoF;
      case TypographyVariant.underline:
        return ThemeSAKS.typography.underlineTypoF;
      case TypographyVariant.strikethrough:
        return ThemeSAKS.typography.strikethroughTypoF;
    }
  }
}
