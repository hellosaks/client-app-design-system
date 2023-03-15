import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/referral_card.dart";
import "package:client_app_design_system/utils/data_label.dart";
import "package:flutter/painting.dart";
import "package:flutter_test/flutter_test.dart";
import "package:intl/intl.dart";
import "package:mix/mix.dart";

import "../utils/test_wrappers.dart";

void main() {
  group("RefferalCard", () {
    testWidgets(
      "render component",
      (WidgetTester tester) async {
        final widget = ReferralCard(
          payment: Payment.paid,
          icon: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.star,
            ),
          ),
          textBonus: "Bonus",
          name: "Victor",
          valueBonus: "20 reais",
          textPaid: "Pago",
          dataLabel: DataLabel(label: [
            "Indicado",
            "Plano",
            "Pagamento"
          ], data: [
            DateFormat("dd/MM/yyyy").format(
              DateTime(2023, 02, 15),
            ),
            DateFormat("dd/MM/yyyy").format(
              DateTime(2022, 02, 16),
            ),
            DateFormat("dd/MM/yyyy").format(
              DateTime(2022, 02, 17),
            ),
          ]),
          onPressed: () {},
          dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(ReferralCard), findsOneWidget);
      },
    );

    testWidgets(
      "onPressed called on tap card",
      (WidgetTester tester) async {
        bool pressed = false;
        final widget = ReferralCard(
          payment: Payment.paid,
          icon: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.star,
            ),
          ),
          textBonus: "Bonus",
          name: "Victor",
          valueBonus: "20 reais",
          textPaid: "Pago",
          dataLabel: DataLabel(label: [
            "Indicado",
            "Plano",
          ], data: [
            DateFormat("dd/MM/yyyy").format(
              DateTime(2023, 02, 15),
            ),
          ]),
          onPressed: () {
            pressed = true;
          },
          dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));
        await tester.tap(find.byType(ReferralCard));
        await tester.pumpAndSettle();

        expect(pressed, true);
      },
    );

    testWidgets("expected texts and icons", (WidgetTester tester) async {
      final widget = ReferralCard(
        payment: Payment.paid,
        icon: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.star,
          ),
        ),
        textBonus: "Bonus",
        name: "Victor",
        valueBonus: "20 reais",
        textPaid: "Pago",
        dataLabel: DataLabel(label: [
          "Indicado",
          "Plano",
        ], data: [
          DateFormat("dd/MM/yyyy").format(
            DateTime(2023, 02, 15),
          ),
        ]),
        onPressed: () {},
        dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(ReferralCard));
      await tester.pumpAndSettle();

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "Bonus" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "Victor" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h6 &&
                widget.weight == FontWeight.bold,
          ),
          findsOneWidget);
      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "Pago" &&
                widget.color == NewThemeSAKS.colors.utility.conservative &&
                widget.variant == TypographyVariant.h7,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "20 reais" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7 &&
                widget.weight == FontWeight.bold,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "02/02/2022" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "Indicado" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7 &&
                widget.weight == FontWeight.bold,
          ),
          findsOneWidget);
      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "Plano" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7 &&
                widget.weight == FontWeight.bold,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "15/02/2023" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7,
          ),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((widget) =>
              widget is CustomTypography &&
              widget.text == "_" &&
              widget.color == NewThemeSAKS.colors.primary.sea &&
              widget.variant == TypographyVariant.h7),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.props.heroIconsProps!.icon == HeroIcons.star &&
                widget.props.heroIconsProps!.size == 30 &&
                widget.props.heroIconsProps!.color ==
                    NewThemeSAKS.colors.utility.conservative,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.props.heroIconsProps!.icon == HeroIcons.checkCircle &&
                widget.props.heroIconsProps!.size == 24 &&
                widget.props.heroIconsProps!.color ==
                    NewThemeSAKS.colors.utility.conservative,
          ),
          findsOneWidget);

      expect(find.byKey(ReferralCard.circleKey), findsOneWidget);

      final Box box = tester.widget(find.byKey(ReferralCard.cardKey));
      final List<Attribute> boxAttributes = box.mix.attributes;
      expect(
        (boxAttributes[0] as BoxAttributes).color,
        NewThemeSAKS.colors.special.leaf,
      );
      expect(
        (boxAttributes[2] as BoxAttributes).width,
        315,
      );
    });
    testWidgets(
        "expected Payment pending colors, data and input with equal size ",
        (WidgetTester tester) async {
      final widget = ReferralCard(
        payment: Payment.pending,
        icon: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.star,
          ),
        ),
        textBonus: "Bonus",
        name: "Victor",
        valueBonus: "20 reais",
        textPaid: "Pago",
        dataLabel: DataLabel(label: [
          "Indicado",
          "Plano",
        ], data: [
          DateFormat("dd/MM/yyyy").format(
            DateTime(2023, 02, 15),
          ),
          DateFormat("dd/MM/yyyy").format(
            DateTime(2023, 02, 16),
          ),
        ]),
        onPressed: () {},
        dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(ReferralCard));
      await tester.pumpAndSettle();

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.props.heroIconsProps!.icon == HeroIcons.star &&
                widget.props.heroIconsProps!.size == 30 &&
                widget.props.heroIconsProps!.color ==
                    NewThemeSAKS.colors.primary.sea,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "Pago" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "16/02/2023" &&
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.variant == TypographyVariant.h7,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate((widget) =>
              widget is CustomTypography &&
              widget.text == "_" &&
              widget.color == NewThemeSAKS.colors.primary.sea &&
              widget.variant == TypographyVariant.h7),
          findsNothing);

      final Box box = tester.widget(find.byKey(ReferralCard.cardKey));
      final List<Attribute> boxAttributes = box.mix.attributes;
      expect(
        (boxAttributes[0] as BoxAttributes).color,
        NewThemeSAKS.colors.primary.sky,
      );
    });
  });
}
