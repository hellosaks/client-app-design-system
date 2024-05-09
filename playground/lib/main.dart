import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:playground/widgets/avatar.dart';
import 'package:playground/widgets/buttons/auxiliar_button.dart';
import 'package:playground/widgets/buttons/center_button.dart';
import 'package:playground/widgets/buttons/primary_button.dart';
import 'package:playground/widgets/buttons/secondary_button.dart';
import 'package:playground/widgets/buttons/tertiary_button.dart';
import 'package:playground/widgets/card_banner.dart';
import 'package:playground/widgets/card_investment.dart';
import 'package:playground/widgets/chart_distribution.dart';
import 'package:playground/widgets/circular_loading.dart';
import 'package:playground/widgets/common_modal.dart';
import 'package:playground/widgets/custom_accordion.dart';
import 'package:playground/widgets/custom_line_chart.dart';
import 'package:playground/widgets/custom_tabs.dart';
import 'package:playground/widgets/custom_typography.dart';
import 'package:playground/widgets/icons.dart';
import 'package:playground/widgets/indication_filters.dart';
import 'package:playground/widgets/notification_bell.dart';
import 'package:playground/widgets/referral_button.dart';
import 'package:playground/widgets/referral_card.dart';
import 'package:playground/widgets/simple_transaction.dart';
import 'package:playground/widgets/skeleton.dart';
import 'package:playground/widgets/special_button.dart';

void main() {
  final navigatorKey = GlobalKey<NavigatorState>();

  final registry = JsonWidgetRegistry.instance;
  registry.navigatorKey = navigatorKey;
  for (final builder in mapBuilders.entries) {
    registry.registerCustomBuilder(
      builder.key,
      JsonWidgetBuilderContainer(
        builder: (map, {registry}) =>
            builder.value(map as Map<dynamic, dynamic>, registry: registry),
      ),
    );
  }

  runApp(
    DocPreview(
      sections: [
        ElementsSection(
          title: 'Buttons',
          elements: [
            centerButtonDoc,
            primaryButtonDoc,
            secondaryButtonDoc,
            tertiaryButtonDoc,
            specialButtonDoc,
            auxButtonDoc
          ],
        ),
        ElementsSection(
          title: 'Cards',
          elements: [referralCardDoc, cardBannerDoc, cardInvestmentDoc],
        ),
        ElementsSection(
          elements: [
            circularChart,
            customLineChart,
          ],
          title: "chart",
        ),
        ElementsSection(
          title: 'CustomTypography',
          elements: [
            customTypographyDoc,
          ],
        ),
        ElementsSection(
          title: 'Widgets',
          elements: [
            customAccordion,
            iconDoc,
            referralButtonDoc,
            indicationFiltersDoc,
            customTabsDoc,
            skeletonDoc,
            commonModalDoc,
            circularLoadingDoc,
            notificationBell,
            avatar,
            simpleTransactionDoc,
          ],
        ),
      ],
    ),
  );
}
