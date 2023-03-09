import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" as material show Icon;
import "package:flutter_test/flutter_test.dart";
import "package:heroicons/heroicons.dart";

import "../utils/test_wrappers.dart";

void main() {
  group("Icon", () {
    testWidgets("should render heroicons", (tester) async {
      final widget = Icon(
        props: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.academicCap,
          ),
        ),
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(HeroIcon), findsOneWidget);
    });

    testWidgets("should render unicons", (tester) async {
      final widget = Icon(
        props: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsSolid.airplay,
          ),
        ),
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(material.Icon), findsOneWidget);
    });

    testWidgets("should aseert is throw", (tester) async {
      // throws assertion error to unicons
      expect(
        () {
          Icon(
            props: IconProps(
              variant: IconVariant.unicons,
              heroIconsProps: HeroIconsProps(
                icon: HeroIcons.academicCap,
              ),
            ),
          );
        },
        throwsAssertionError,
      );

      // throws assertion error to heroicons
      expect(
        () {
          Icon(
            props: IconProps(
              variant: IconVariant.heroicons,
              uniconsProps: UniconsProps(
                icon: UniconsSolid.airplay,
              ),
            ),
          );
        },
        throwsAssertionError,
      );
    });
  });
}
