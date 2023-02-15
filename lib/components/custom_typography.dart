import "package:client_app_design_system/theme/theme_saks.dart";
import "package:client_app_design_system/utils/app_size.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:mix/mix.dart";

@docWidget
class CustomTypography extends StatelessWidget {
  const CustomTypography({
    Key? key,
    required this.variant,
    required this.text,
    this.weight = FontWeight.w400,
    this.color = Colors.black,
    this.align = TextAlign.left,
    this.mix,
  }) : super(key: key);

  final FontWeight weight;
  final TypographyVariant variant;
  final String text;
  final Color color;
  final TextAlign align;
  final Mix<Attribute>? mix;

  @override
  Widget build(BuildContext context) {
    final style = Mix.combine(
      _getFontVariant(),
      Mix(
        fontWeight(weight),
        textColor(color),
        textAlign(align),
        textScaleFactor(ThemeSAKS.typography.textScaleFactor),
      ),
      mix,
    );

    return TextMix(text, mix: style);
  }

  Mix<TextAttributes> _adjustFontSize(Mix<TextAttributes> type) {
    final double fontSizeAdjust = AppSize(context: Get.context)
        .getHeight(type.attributes[1].style!.fontSize!);
    return Mix.combine(type, Mix(fontSize(fontSizeAdjust)));
  }

  Mix<TextAttributes> _getFontVariant() {
    switch (variant) {
      case TypographyVariant.h1:
        return _adjustFontSize(ThemeSAKS.typography.h1Typo);
      case TypographyVariant.h2:
        return _adjustFontSize(ThemeSAKS.typography.h2Typo);
      case TypographyVariant.h3:
        return _adjustFontSize(ThemeSAKS.typography.h3Typo);
      case TypographyVariant.h4:
        return _adjustFontSize(ThemeSAKS.typography.h4Typo);
      case TypographyVariant.h5:
        return _adjustFontSize(ThemeSAKS.typography.h5Typo);
      case TypographyVariant.h6:
        return _adjustFontSize(ThemeSAKS.typography.h6Typo);
      case TypographyVariant.h7:
        return _adjustFontSize(ThemeSAKS.typography.h7Typo);
      case TypographyVariant.t1:
        return _adjustFontSize(ThemeSAKS.typography.t1Typo);
      case TypographyVariant.t2:
        return _adjustFontSize(ThemeSAKS.typography.t2Typo);
      case TypographyVariant.t3:
        return _adjustFontSize(ThemeSAKS.typography.t3Typo);
      case TypographyVariant.t4:
        return _adjustFontSize(ThemeSAKS.typography.t4Typo);
    }
  }
}
