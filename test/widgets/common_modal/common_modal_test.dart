import "package:client_app_design_system/client_app_design_system.dart"
    hide DropdownValue;
import "package:flutter_test/flutter_test.dart";
import "package:material_ui/material_ui.dart" hide Icon;

import "../../utils/test_wrappers.dart";

void main() {
  group("Common modal", () {
    testWidgets(
      "should render correctly",
      (WidgetTester tester) async {
        final widget = CommonModal(
          title: "title",
          description: "description",
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
        );
        await tester.pumpWidget(wrapWithMaterialApp(widget));

        await tester.pumpAndSettle();
        expect(find.byType(CommonModal), findsOneWidget);
      },
    );

    testWidgets(
      "should render elements",
      (WidgetTester tester) async {
        final widget = CommonModal(
          title: "title",
          description: "description",
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        await tester.pumpAndSettle();

        expect(find.byKey(const Key("line-header")), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);

        expect(
          find.widgetWithText(
            CustomTypography,
            "title",
          ),
          findsOneWidget,
        );

        expect(
          find.widgetWithText(
            CustomTypography,
            "description",
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      "should call correctly onPress",
      (WidgetTester tester) async {
        bool onCloseButtonPressed = false;
        bool onPressButtonPressed = false;
        bool onTertiaryButtonPressed = false;

        final widget = CommonModal(
          modalHeight: 700,
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          title: "title",
          description: "description",
          onPressButton: ButtonProperties(
            onPressed: () {
              onPressButtonPressed = true;
            },
            title: "onPressButton",
          ),
          onCloseButton: ButtonProperties(
            onPressed: () {
              onCloseButtonPressed = true;
            },
            title: "onCloseButton",
          ),
          tertiaryButton: ButtonProperties(
            onPressed: () {
              onTertiaryButtonPressed = true;
            },
            title: "onTertiaryButtonPressed",
          ),
        );
        await tester.pumpWidget(wrapWithMaterialApp(widget));

        await tester.pumpAndSettle();
        expect(find.byType(CommonModal), findsOneWidget);

        await tester.tap(
          find.byWidgetPredicate(
            (widget) =>
                widget is SecondaryButton && widget.text == "onCloseButton",
          ),
        );
        await tester.pumpAndSettle();

        expect(onCloseButtonPressed, true);

        await tester.tap(
          find.byWidgetPredicate(
            (widget) =>
                widget is SecondaryButton && widget.text == "onPressButton",
          ),
        );
        await tester.pumpAndSettle();
        expect(onPressButtonPressed, true);

        await tester.tap(
          find.byWidgetPredicate(
            (widget) =>
                widget is TertiaryButton &&
                widget.text == "onTertiaryButtonPressed",
          ),
        );
        await tester.pumpAndSettle();
        expect(onTertiaryButtonPressed, true);
      },
    );
  });
}
