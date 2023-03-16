import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:playground/widgets/auxiliar_button.dart';
import 'package:playground/widgets/card_banner.dart';
import 'package:playground/widgets/custom_typography.dart';
import 'package:playground/widgets/icons.dart';
import 'package:playground/widgets/indication_filters.dart';
import 'package:playground/widgets/referral_button.dart';
import 'package:playground/widgets/special_button.dart';
import 'package:playground/widgets/tertiary_button.dart';

void main() {
  runApp(
    DocPreview(
      sections: [
        ElementsSection(
          title: 'Buttons',
          elements: [
            tertiaryButtonDoc,
            auxButtonDoc,
            specialButtonDoc,
          ],
        ),
        ElementsSection(
          title: 'Widgets',
          elements: [
            customTypographyDoc,
            iconDoc,
            referralButtonDoc,
            indicationFiltersDoc,
            cardBannerDoc,
          ],
        ),
      ],
    ),
  );
}
