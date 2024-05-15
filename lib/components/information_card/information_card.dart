import "package:client_app_design_system/utils/enums/enums.dart";
import "package:flutter/material.dart";
import "package:doc_widget/doc_widget.dart";
import "../custom_typography/custom_typography.dart";

@docWidget
class InformationCard extends StatelessWidget {
  final List<InformationCardRow> rows;

  const InformationCard({Key? key, required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color.fromRGBO(246, 246, 246, 1)),
        child: ListView(
          shrinkWrap: true,
          children: rows.map((row) => row).toList(),
        ),
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
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTypography(
            variant: TypographyVariant.h6,
            text: info,
            color: Color.fromRGBO(109, 109, 109, 1),
          ),
          CustomTypography(variant: TypographyVariant.h6, text: value),
        ],
      ),
    );
  }
}
