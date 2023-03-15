import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  group("ButtonTertiary [SAKS]", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      final widget = ButtonTertiary(
        onPressed: () {},
        text: "Button",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(ButtonTertiary), findsOneWidget);
    });

    testWidgets("should correctly call onPress", (WidgetTester tester) async {
      bool pressed = false;

      final widget = ButtonTertiary(
        onPressed: () {
          pressed = true;
        },
        text: "Button",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(ButtonTertiary));
      await tester.pump();

      expect(pressed, true);
    });

    group("with icons", () {
      testWidgets("should render correctly left icon",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          leftIcon: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.checkCircle,
            ),
          ),
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly left icon props ",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          leftIcon: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.checkCircle,
            ),
          ),
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(
            finded.props.heroIconsProps?.color, ThemeSAKS.colors.primary.saks);
      });
      testWidgets("should render right correctly", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          rightIcon: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.checkCircle,
            ),
          ),
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly right icon props",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          rightIcon: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.checkCircle,
            ),
          ),
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(
            finded.props.heroIconsProps?.color, ThemeSAKS.colors.primary.saks);
      });
    });

    group("when disabled", () {
      testWidgets("dont call onPress", (WidgetTester tester) async {
        bool pressed = false;

        final widget = ButtonTertiary(
          disable: true,
          onPressed: () {
            pressed = true;
          },
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        await tester.tap(find.byType(ButtonTertiary));
        await tester.pump();

        expect(pressed, false);
      });

      testWidgets("should render correctly opacity",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          onPressed: () {},
          text: "Button",
          disable: true,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final material.Opacity finded =
            tester.widget(find.byType(material.Opacity));

        expect(finded.opacity, 0.5);
      });
    });

    group("styles label", () {
      testWidgets("underline", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          underline: true,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            (tester.widget(find.byType(CustomTypography)) as CustomTypography);

        expect(finded.variant, TypographyVariant.underline);
        expect(finded.color, ThemeSAKS.colors.primary.saks);
      });

      testWidgets("strikethrough", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          strikethrough: true,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            (tester.widget(find.byType(CustomTypography)) as CustomTypography);

        expect(finded.variant, TypographyVariant.strikethrough);
        expect(finded.color, ThemeSAKS.colors.primary.saks);
      });
    });
  });

  group("ButtonTertiary variant colors", () {
    testWidgets("should render SEA color", (WidgetTester tester) async {
      final widget = ButtonTertiary(
        onPressed: () {},
        colorAttributes: ColorAttributesButton(
          bgColor: ThemeSAKS.colors.primary.sea,
          pressColor: ThemeSAKS.colors.secondary.bay,
        ),
        text: "Button",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final ButtonTertiary finded = tester.widget(find.byType(ButtonTertiary));
      expect(finded.colorAttributes?.bgColor, ThemeSAKS.colors.primary.sea);
      expect(
          finded.colorAttributes?.pressColor, ThemeSAKS.colors.secondary.bay);
    });

    testWidgets("should render DANGER color", (WidgetTester tester) async {
      final widget = ButtonTertiary(
        onPressed: () {},
        colorAttributes: ColorAttributesButton(
          bgColor: ThemeSAKS.colors.utility.aggressive,
          pressColor: ThemeSAKS.colors.special.rose,
        ),
        text: "Button",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final ButtonTertiary finded = tester.widget(find.byType(ButtonTertiary));
      expect(
          finded.colorAttributes?.bgColor, ThemeSAKS.colors.utility.aggressive);
      expect(finded.colorAttributes?.pressColor, ThemeSAKS.colors.special.rose);
    });
  });
}
