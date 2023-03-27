import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/buttons/center_button.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:flutter/material.dart" hide Icon;
import "package:flutter_test/flutter_test.dart";
import "package:get/get.dart";
import "package:mix/mix.dart";

import "../../utils/test_wrappers.dart";

void main() {
  final withSeaColorPropsNotBG = ColorAttributesButton(
    insideColor: ThemeSAKS.colors.primary.sea,
    pressColor: ThemeSAKS.colors.secondary.anchor,
  );

  final withPrimaryColorPropsNotBG = ColorAttributesButton(
    insideColor: ThemeSAKS.colors.primary.saks,
    pressColor: ThemeSAKS.colors.secondary.bay,
  );

  final withPrimaryColorProps = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.primary.saks,
    pressColor: ThemeSAKS.colors.secondary.bay,
  );

  group("Center Button", () {
    testWidgets("", (tester) async {
      final widget = CenterButton(
        onPressed: () {},
        colorAttributes: withSeaColorPropsNotBG,
        icon: UniconsLine.arrow_left,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CenterButton), findsOneWidget);
    });

    testWidgets("should call correctly onPress", (tester) async {
      bool pressed = false;
      final widget = CenterButton(
        onPressed: () {
          pressed = true;
        },
        colorAttributes: withSeaColorPropsNotBG,
        icon: UniconsLine.arrow_left,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(CenterButton));
      expect(pressed, true);
    });

    testWidgets("should set correctly properties", (tester) async {
      final widget = CenterButton(
        onPressed: () {},
        colorAttributes: withPrimaryColorProps,
        icon: UniconsLine.arrow_left,
      );
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Box finded =
          tester.widget<Box>(find.byKey(CenterButton.boxContainerKey));

      // testing color
      final Attribute? boxAttributes =
          finded.mix.attributes.firstWhereOrNull((element) {
        try {
          return (element as BoxAttributes).color != null;
        } catch (e) {
          return false;
        }
      });

      expect(
        (boxAttributes as BoxAttributes?)?.color,
        ThemeSAKS.colors.primary.saks,
      );

      final Icon findedIcon = tester.widget<Icon>(find.byType(Icon));
      expect(
        findedIcon.props.uniconsProps?.color,
        Colors.white,
      );

      expect(
        findedIcon.props.uniconsProps?.size,
        40,
      );
    });

    group("With primary color", () {
      testWidgets("should set correctly properties", (tester) async {
        final widget = CenterButton(
          onPressed: () {},
          colorAttributes: withPrimaryColorPropsNotBG,
          icon: UniconsLine.arrow_left,
        );
        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Box finded =
            tester.widget<Box>(find.byKey(CenterButton.boxContainerKey));

        // testing color
        final Attribute? boxAttributes =
            finded.mix.attributes.firstWhereOrNull((element) {
          try {
            return (element as BoxAttributes).color != null;
          } catch (e) {
            return false;
          }
        });

        expect(
          (boxAttributes as BoxAttributes?)?.color,
          null,
        );

        final Icon findedIcon = tester.widget<Icon>(find.byType(Icon));
        expect(
          findedIcon.props.uniconsProps?.color,
          ThemeSAKS.colors.primary.saks,
        );

        expect(
          findedIcon.props.uniconsProps?.size,
          40,
        );
      });
    });
  });
}
