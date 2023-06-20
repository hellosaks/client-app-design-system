import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  const text = "Button";

  final seaColor = ThemeSAKS.colors.primary.sea;

  final leftIconProps = IconProps(
    variant: IconVariant.unicons,
    uniconsProps: UniconsProps(
      icon: UniconsLine.arrow_left,
    ),
  );

  final rightIconProps = IconProps(
    variant: IconVariant.unicons,
    uniconsProps: UniconsProps(
      icon: UniconsLine.arrow_right,
    ),
  );

  final widget = CoreButton(text: text, color: seaColor);
  final widgetWithLeftIcon = CoreButton(
    text: text,
    color: seaColor,
    leftIcon: leftIconProps,
  );
  final widgetWitRightIcon = CoreButton(
    text: text,
    color: seaColor,
    rightIcon: rightIconProps,
  );

  group("Core button", () {
    testWidgets("should render correctly", (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CoreButton), findsOneWidget);
    });

    testWidgets("should render correctly left icon", (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(widgetWithLeftIcon));

      expect(find.byType(CoreButton), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets("should render correctly right icon", (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(widgetWitRightIcon));

      expect(find.byType(CoreButton), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets("should render correctly end icon", (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          CoreButton(
            text: text,
            color: seaColor,
            leftIcon: leftIconProps,
            checked: true,
          ),
        ),
      );

      expect(find.byType(CoreButton), findsOneWidget);
      expect(find.byKey(CoreButton.keyEndIcon), findsOneWidget);
    });

    testWidgets("should render correctly properties", (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(
          CoreButton(
            text: text,
            color: seaColor,
            rightIcon: rightIconProps,
            underline: true,
          ),
        ),
      );

      final CustomTypography findedCustomTypography =
          tester.widget(find.byType(CustomTypography));
      expect(findedCustomTypography.text, text);
      expect(findedCustomTypography.variant, TypographyVariant.underline);
      expect(findedCustomTypography.color, seaColor);

      final Icon findedIcon = tester.widget(find.byType(Icon));
      expect(
        findedIcon.props.uniconsProps?.icon,
        rightIconProps.uniconsProps?.icon,
      );

      // box icon test
      final SizedBox finded = tester.widget(find.byKey(CoreButton.keyIconBox));

      expect(
        finded.height,
        24,
      );

      expect(
        finded.height,
        24,
      );

      // box icon test
      Row findedRow = tester.widget(find.byKey(CoreButton.keyContent));

      expect(
        findedRow.children.length,
        1,
      );

      //children on row container
      await tester.pumpWidget(
        wrapWithMaterialApp(
          CoreButton(
            text: text,
            color: seaColor,
            checked: true,
            rightIcon: rightIconProps,
            underline: true,
          ),
        ),
      );

      //children on row container when checked is true
      findedRow = tester.widget(find.byKey(CoreButton.keyContent));
      expect(
        findedRow.children.length,
        3,
      );
    });
  });
}
