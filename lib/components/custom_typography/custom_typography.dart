import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/custom_typography/selectable.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart";

@docWidget
class CustomTypography extends StatelessWidget {
  final TypographyVariant variant;
  final String text;

  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  final bool selectable;
  final TextOverflow? overflow;

  const CustomTypography({
    super.key,
    required this.variant,
    required this.text,
    this.selectable = false,
    this.weight = FontWeight.w400,
    this.color = Colors.black,
    this.align = TextAlign.left,
    this.overflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return Selectable(
        text: text,
        variant: variant,
        align: align,
        color: color,
        weight: weight,
        key: key,
      );
    }
    final displayText =
        variant == TypographyVariant.cta ? text.toUpperCase() : text;
    final style = _getFontVariant().copyWith(
      fontWeight: weight,
      color: color,
    );

    return Text(
      displayText,
      style: style,
      textAlign: align,
      textScaleFactor: ThemeSAKS.typography.textScaleFactor,
      overflow: overflow,
    );
  }

  TextStyle _getFontVariant() {
    switch (variant) {
      case TypographyVariant.h1:
        return ThemeSAKS.typography.h1Typo;
      case TypographyVariant.h2:
        return ThemeSAKS.typography.h2Typo;
      case TypographyVariant.h3:
        return ThemeSAKS.typography.h3Typo;
      case TypographyVariant.h4:
        return ThemeSAKS.typography.h4Typo;
      case TypographyVariant.h5:
        return ThemeSAKS.typography.h5Typo;
      case TypographyVariant.h6:
        return ThemeSAKS.typography.h6Typo;
      case TypographyVariant.h7:
        return ThemeSAKS.typography.h7Typo;
      case TypographyVariant.cta:
        return ThemeSAKS.typography.ctaTypo;
      case TypographyVariant.underline:
        return ThemeSAKS.typography.underlineTypo;
      case TypographyVariant.strikethrough:
        return ThemeSAKS.typography.strikethroughTypo;
    }
  }
}
