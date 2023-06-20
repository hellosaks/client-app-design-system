import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/custom_typography/custom_typography_builder.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:playground/render_service.dart';
import 'package:playground/widgets/avatar.dart';
import 'package:playground/widgets/buttons/auxiliar_button.dart';
import 'package:playground/widgets/buttons/center_button.dart';
import 'package:playground/widgets/buttons/primary_button.dart';
import 'package:playground/widgets/buttons/secondary_button.dart';
import 'package:playground/widgets/buttons/tertiary_button.dart';
import 'package:playground/widgets/card_banner.dart';
import 'package:playground/widgets/custom_tabs.dart';
import 'package:playground/widgets/custom_typography.dart';
import 'package:playground/widgets/icons.dart';
import 'package:playground/widgets/indication_filters.dart';
import 'package:playground/widgets/referral_button.dart';
import 'package:playground/widgets/referral_card.dart';
import 'package:playground/widgets/skeleton.dart';
import 'package:playground/widgets/special_button.dart';

void main() {
  final navigatorKey = GlobalKey<NavigatorState>();

  final registry = JsonWidgetRegistry.instance;
  registry.navigatorKey = navigatorKey;

  RenderService().bindComponents(
    AvatarBuilder.type,
    AvatarBuilder.fromDynamic,
  );

  RenderService().bindComponents(
    CustomTypographyBuilder.type,
    CustomTypographyBuilder.fromDynamic,
  );

  RenderService().bindComponents(
    IconBuilder.type,
    IconBuilder.fromDynamic,
  );

  RenderService().bindComponents(
    SecondaryButtonBuilder.type,
    SecondaryButtonBuilder.fromDynamic,
  );

  RenderService().bindComponents(
    SvgBuilder.type,
    SvgBuilder.fromDynamic,
  );

  RenderService().bindComponents(
    CustomDividerBuilder.type,
    CustomDividerBuilder.fromDynamic,
  );
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
          elements: [
            referralCardDoc,
            cardBannerDoc,
          ],
        ),
        ElementsSection(
          title: 'Avatar',
          elements: [avatar],
        ),
        ElementsSection(
          title: 'Widgets',
          elements: [
            customTypographyDoc,
            iconDoc,
            referralButtonDoc,
            indicationFiltersDoc,
            customTabsDoc,
            skeletonDoc
          ],
        ),
      ],
    ),
  );
}
