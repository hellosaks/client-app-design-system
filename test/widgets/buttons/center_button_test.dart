import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_ui/material_ui.dart" hide Icon;

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
    testWidgets("should render correctly", (tester) async {
      final widget = CenterButton(
        onPressed: () {},
        colorAttributes: withSeaColorPropsNotBG,
        icon: UniconsLine.arrow_left,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CenterButton), findsOneWidget);
    });

    testWidgets("should render correctly gesture detector", (tester) async {
      final widget = CenterButton(
        onPressed: () {},
        colorAttributes: withSeaColorPropsNotBG,
        icon: UniconsLine.arrow_left,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(InkWell), findsOneWidget);

      final InkWell finded = tester.widget<InkWell>(find.byType(InkWell));
      expect(finded.borderRadius, BorderRadius.circular(30.0));
      expect(finded.focusColor, OldThemeSAKS.colors.grayTone.colorGray13);
      expect(finded.hoverColor, OldThemeSAKS.colors.grayTone.colorGray13);
      expect(finded.splashColor, OldThemeSAKS.colors.grayTone.colorGray13);
      expect(finded.highlightColor, OldThemeSAKS.colors.grayTone.colorGray13);
    });

    testWidgets("should render correctly gesture detector disabled",
        (tester) async {
      final widget = CenterButton(
        onPressed: () {},
        disabled: true,
        colorAttributes: withSeaColorPropsNotBG,
        icon: UniconsLine.arrow_left,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(InkWell), findsOneWidget);

      final InkWell finded = tester.widget<InkWell>(find.byType(InkWell));
      expect(finded.borderRadius, BorderRadius.circular(30.0));
      expect(finded.focusColor, Colors.transparent);
      expect(finded.hoverColor, Colors.transparent);
      expect(finded.splashColor, Colors.transparent);
      expect(finded.highlightColor, Colors.transparent);
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

      final Container found =
          tester.widget<Container>(find.byKey(CenterButton.boxContainerKey));

      final BoxDecoration decoration = found.decoration! as BoxDecoration;

      expect(
        decoration.color,
        ThemeSAKS.colors.primary.saks,
      );

      final Icon foundIcon = tester.widget<Icon>(find.byType(Icon));
      expect(
        foundIcon.props.uniconsProps?.color,
        Colors.white,
      );

      expect(
        foundIcon.props.uniconsProps?.size,
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

        final Container found =
            tester.widget<Container>(find.byKey(CenterButton.boxContainerKey));

        final BoxDecoration decoration = found.decoration! as BoxDecoration;

        expect(decoration.color, Colors.transparent);

        final Icon foundIcon = tester.widget<Icon>(find.byType(Icon));
        expect(
          foundIcon.props.uniconsProps?.color,
          ThemeSAKS.colors.primary.saks,
        );

        expect(
          foundIcon.props.uniconsProps?.size,
          40,
        );
      });
    });
  });
}
