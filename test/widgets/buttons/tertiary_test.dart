import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  const text = "Button";

  final withSeaColorProps = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.primary.sea,
    pressColor: ThemeSAKS.colors.secondary.anchor,
  );

  final withDangerColorProps = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.utility.aggressive,
    pressColor: ThemeSAKS.colors.special.rose,
  );

  final leftIconProps = IconProps(
    variant: IconVariant.heroicons,
    heroIconsProps: HeroIconsProps(
      icon: HeroIcons.arrowLeft,
    ),
  );

  final rightIconProps = IconProps(
    variant: IconVariant.heroicons,
    heroIconsProps: HeroIconsProps(
      icon: HeroIcons.arrowRight,
    ),
  );

  group("TertiaryButton [SAKS]", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      final widget = TertiaryButton(
        onPressed: () {},
        text: text,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(TertiaryButton), findsOneWidget);
    });

    testWidgets("should correctly call onPress", (WidgetTester tester) async {
      bool pressed = false;

      final widget = TertiaryButton(
        onPressed: () {
          pressed = true;
        },
        text: text,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(TertiaryButton));
      await tester.pump();

      expect(pressed, true);
    });

    group("with icons", () {
      testWidgets("should render correctly left icon",
          (WidgetTester tester) async {
        final widget = TertiaryButton(
          leftIcon: leftIconProps,
          onPressed: () {},
          text: text,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly left icon props ",
          (WidgetTester tester) async {
        final widget = TertiaryButton(
          leftIcon: leftIconProps,
          onPressed: () {},
          text: text,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(
          finded.props.heroIconsProps?.color,
          ThemeSAKS.colors.primary.saks,
        );
      });
      testWidgets("should render right icon props",
          (WidgetTester tester) async {
        final widget = TertiaryButton(
          rightIcon: rightIconProps,
          onPressed: () {},
          text: text,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly right icon props",
          (WidgetTester tester) async {
        final widget = TertiaryButton(
          rightIcon: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.checkCircle,
            ),
          ),
          onPressed: () {},
          text: text,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(
          finded.props.heroIconsProps?.color,
          ThemeSAKS.colors.primary.saks,
        );
      });
    });

    group("when disabled", () {
      testWidgets("dont call onPress", (WidgetTester tester) async {
        bool pressed = false;

        final widget = TertiaryButton(
          disable: true,
          onPressed: () {
            pressed = true;
          },
          text: text,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        await tester.tap(find.byType(TertiaryButton));
        await tester.pump();

        expect(pressed, false);
      });

      testWidgets("should render correctly opacity",
          (WidgetTester tester) async {
        final widget = TertiaryButton(
          onPressed: () {},
          text: text,
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
        final widget = TertiaryButton(
          underline: true,
          onPressed: () {},
          text: text,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            tester.widget(find.byType(CustomTypography)) as CustomTypography;

        expect(finded.variant, TypographyVariant.underline);
        expect(finded.color, ThemeSAKS.colors.primary.saks);
      });

      testWidgets("strikethrough", (WidgetTester tester) async {
        final widget = TertiaryButton(
          strikethrough: true,
          onPressed: () {},
          text: text,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            tester.widget(find.byType(CustomTypography)) as CustomTypography;

        expect(finded.variant, TypographyVariant.strikethrough);
        expect(finded.color, ThemeSAKS.colors.primary.saks);
      });
    });
  });

  group("TertiaryButton variant colors", () {
    testWidgets("should render SEA color", (WidgetTester tester) async {
      final widget = TertiaryButton(
        onPressed: () {},
        colorAttributes: withSeaColorProps,
        text: text,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final TertiaryButton finded = tester.widget(find.byType(TertiaryButton));
      expect(finded.colorAttributes?.bgColor, ThemeSAKS.colors.primary.sea);
      expect(
        finded.colorAttributes?.pressColor,
        ThemeSAKS.colors.secondary.anchor,
      );
    });

    testWidgets("should render DANGER color", (WidgetTester tester) async {
      final widget = TertiaryButton(
        onPressed: () {},
        colorAttributes: withDangerColorProps,
        text: text,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final TertiaryButton finded = tester.widget(find.byType(TertiaryButton));
      expect(
        finded.colorAttributes?.bgColor,
        ThemeSAKS.colors.utility.aggressive,
      );
      expect(finded.colorAttributes?.pressColor, ThemeSAKS.colors.special.rose);
    });
  });
}
