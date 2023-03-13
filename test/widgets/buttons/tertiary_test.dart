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
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly left icon props ",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(finded.props.heroIconsProps?.color,
            NewThemeSAKS.colors.primary.saks);
      });
      testWidgets("should render right correctly", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          rightIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly right icon props",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(finded.props.heroIconsProps?.color,
            NewThemeSAKS.colors.primary.saks);
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
        expect(finded.color, NewThemeSAKS.colors.primary.saks);
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
        expect(finded.color, NewThemeSAKS.colors.primary.saks);
      });
    });
  });

  group("ButtonTertiary [SEA]", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      final widget = ButtonTertiary(
        onPressed: () {},
        colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.primary.sea,
          pressColor: NewThemeSAKS.colors.secondary.bay,
        ),
        text: "Button",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(ButtonTertiary), findsOneWidget);
    });

    testWidgets("should correctly call onPress", (WidgetTester tester) async {
      bool pressed = false;

      final widget = ButtonTertiary(
        colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.primary.sea,
          pressColor: NewThemeSAKS.colors.secondary.bay,
        ),
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly left icon props ",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(finded.props.heroIconsProps?.color,
            NewThemeSAKS.colors.primary.sea);
      });
      testWidgets("should render right correctly", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          rightIcon: HeroIcons.academicCap,
          onPressed: () {},
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly right icon props",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(finded.props.heroIconsProps?.color,
            NewThemeSAKS.colors.primary.sea);
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            (tester.widget(find.byType(CustomTypography)) as CustomTypography);

        expect(finded.variant, TypographyVariant.underline);
        expect(finded.color, NewThemeSAKS.colors.primary.sea);
      });

      testWidgets("strikethrough", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          strikethrough: true,
          onPressed: () {},
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.primary.sea,
            pressColor: NewThemeSAKS.colors.secondary.bay,
          ),
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            (tester.widget(find.byType(CustomTypography)) as CustomTypography);

        expect(finded.variant, TypographyVariant.strikethrough);
        expect(finded.color, NewThemeSAKS.colors.primary.sea);
      });
    });
  });

  group("ButtonTertiary [DANGER] ", () {
    testWidgets("should render correctly", (WidgetTester tester) async {
      final widget = ButtonTertiary(
        onPressed: () {},
        colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.utility.aggressive,
          pressColor: NewThemeSAKS.colors.special.rose,
        ),
        text: "Button",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(ButtonTertiary), findsOneWidget);
    });

    testWidgets("should correctly call onPress", (WidgetTester tester) async {
      bool pressed = false;

      final widget = ButtonTertiary(
        colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.utility.aggressive,
          pressColor: NewThemeSAKS.colors.special.rose,
        ),
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly left icon props ",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(finded.props.heroIconsProps?.color,
            NewThemeSAKS.colors.utility.aggressive);
      });
      testWidgets("should render right correctly", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          rightIcon: HeroIcons.academicCap,
          onPressed: () {},
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(Icon), findsOneWidget);
      });

      testWidgets("should render correctly right icon props",
          (WidgetTester tester) async {
        final widget = ButtonTertiary(
          leftIcon: HeroIcons.academicCap,
          onPressed: () {},
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final Icon finded = tester.widget(find.byType(Icon));
        expect(finded.props.heroIconsProps?.color,
            NewThemeSAKS.colors.utility.aggressive);
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
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
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            (tester.widget(find.byType(CustomTypography)) as CustomTypography);

        expect(finded.variant, TypographyVariant.underline);
        expect(finded.color, NewThemeSAKS.colors.utility.aggressive);
      });

      testWidgets("strikethrough", (WidgetTester tester) async {
        final widget = ButtonTertiary(
          strikethrough: true,
          onPressed: () {},
          colorAttributes: ColorAttributesButton(
            bgColor: NewThemeSAKS.colors.utility.aggressive,
            pressColor: NewThemeSAKS.colors.special.rose,
          ),
          text: "Button",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final finded =
            (tester.widget(find.byType(CustomTypography)) as CustomTypography);

        expect(finded.variant, TypographyVariant.strikethrough);
        expect(finded.color, NewThemeSAKS.colors.utility.aggressive);
      });
    });
  });
}
