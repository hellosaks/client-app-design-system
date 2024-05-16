import "package:client_app_design_system/theme/old_palette.dart";
import "package:client_app_design_system/utils/enums/enums.dart";
import "package:flutter/material.dart";
import "package:doc_widget/doc_widget.dart";
import "../custom_typography/custom_typography.dart";
import "package:client_app_design_system/theme/theme_saks.dart";

@docWidget
class InformationCard extends StatelessWidget {
  final List<InformationCardRow> rows;

  const InformationCard({Key? key, required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(ThemeSAKS.shape.borderRadiusCard)),
          color: ThemeSAKS.colors.secondary.cards),
      child: Column(
        children: rows.map((row) => row).toList(),
      ),
    );
  }
}

class InformationCardRow extends StatelessWidget {
  final String info;
  final String value;

  const InformationCardRow({Key? key, required this.info, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTypography(
              variant: TypographyVariant.h6,
              text: info,
              color: OldPalette().grayTone.colorGray09),
          CustomTypography(variant: TypographyVariant.h6, text: value),
        ],
      ),
    );
  }
}
