import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_ui/material_ui.dart" hide Icon;

import "../utils/test_wrappers.dart";

void main() {
  group("ReferralCard", () {
    testWidgets(
      "render component",
      (WidgetTester tester) async {
        final widget = ReferralCard(
          payment: ReferralPaymentType.paid,
          icon: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(
              icon: UniconsLine.user,
              size: 20,
            ),
          ),
          textBonus: "Bonus",
          name: "Victo",
          valueBonus: "R\$20,00",
          textPaid: "Pago",
          dataLabel: [
            DataLabel(
              data: "15/02/2023",
              label: "Indicado",
            ),
            DataLabel(
              data: "15/02/2023",
              label: "Plano ",
            ),
            DataLabel(label: "Pagamento"),
          ],
          dateCard: "12/01/2023",
          onPressed: () {},
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
          payment: ReferralPaymentType.paid,
          icon: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(
              icon: UniconsLine.user,
              size: 20,
            ),
          ),
          textBonus: "Bonus",
          name: "Vict",
          valueBonus: "R\$20,00",
          textPaid: "Pago",
          dataLabel: [
            DataLabel(
              data: "15/02/2023",
              label: "Indicado",
            ),
            DataLabel(
              data: "15/02/2023",
              label: "Plan",
            ),
            DataLabel(label: "Pagamento"),
          ],
          dateCard: "12/01/2023",
          onPressed: () {
            pressed = true;
          },
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));
        await tester.tap(find.byType(ReferralCard));
        await tester.pumpAndSettle();

        expect(pressed, true);
      },
    );

    testWidgets("expected texts and icons", (WidgetTester tester) async {
      final widget = ReferralCard(
        payment: ReferralPaymentType.paid,
        icon: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.user,
          ),
        ),
        textBonus: "Bonus",
        name: "Victor",
        valueBonus: "R\$20,00",
        textPaid: "Pago",
        dataLabel: [
          DataLabel(
            data: "15/02/2023",
            label: "Indicado",
          ),
          DataLabel(label: "Pagamento"),
        ],
        dateCard: "02/02/2022",
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(ReferralCard));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "Bonus" &&
              widget.color == ThemeSAKS.colors.primary.sea.withOpacity(0.5) &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "Victor" &&
              widget.color == ThemeSAKS.colors.primary.sea &&
              widget.variant == TypographyVariant.h6 &&
              widget.weight == FontWeight.bold,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "Pago" &&
              widget.color == ThemeSAKS.colors.utility.conservative &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "R\$20,00" &&
              widget.color == ThemeSAKS.colors.primary.sea &&
              widget.variant == TypographyVariant.h6 &&
              widget.weight == FontWeight.bold,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "02/02/2022" &&
              widget.color == ThemeSAKS.colors.primary.sea.withOpacity(0.5) &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "Indicado" &&
              widget.color == ThemeSAKS.colors.primary.sea &&
              widget.variant == TypographyVariant.h7 &&
              widget.weight == FontWeight.bold,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "15/02/2023" &&
              widget.color == ThemeSAKS.colors.primary.sea.withOpacity(0.5) &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == Constants.hyphen &&
              widget.color == ThemeSAKS.colors.primary.sea.withOpacity(0.5) &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Icon &&
              widget.props.uniconsProps!.icon == UniconsLine.user &&
              widget.props.uniconsProps!.size == 30 &&
              widget.props.uniconsProps!.color ==
                  ThemeSAKS.colors.utility.conservative,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Icon &&
              widget.props.uniconsProps!.icon == UniconsSolid.check_circle &&
              widget.props.uniconsProps!.size == 24 &&
              widget.props.uniconsProps!.color ==
                  ThemeSAKS.colors.utility.conservative,
        ),
        findsOneWidget,
      );

      expect(find.byKey(ReferralCard.circleKey), findsOneWidget);

      final Container box = tester.widget(find.byKey(ReferralCard.cardKey));
      final BoxDecoration decoration = box.decoration! as BoxDecoration;
      expect(decoration.color, ThemeSAKS.colors.special.leaf);
      expect(box.constraints?.minWidth, double.infinity);
    });
    testWidgets(
        "expected ReferralPaymentType pending colors, data and input with equal size ",
        (WidgetTester tester) async {
      final widget = ReferralCard(
        payment: ReferralPaymentType.pending,
        icon: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.star,
          ),
        ),
        textBonus: "Bonus",
        name: "Victor",
        valueBonus: "R\$20,00",
        textPaid: "Pago",
        dataLabel: [
          DataLabel(
            data: "15/02/2023",
            label: "Indicado",
          ),
          DataLabel(
            label: "Pagamento",
            data: "16/02/2023",
          ),
        ],
        dateCard: "02/02/2022",
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(ReferralCard));
      await tester.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Icon &&
              widget.props.uniconsProps!.icon == UniconsLine.star &&
              widget.props.uniconsProps!.size == 30 &&
              widget.props.uniconsProps!.color == ThemeSAKS.colors.primary.sea,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "Pago" &&
              widget.color == ThemeSAKS.colors.primary.sea.withOpacity(0.5) &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "16/02/2023" &&
              widget.color == ThemeSAKS.colors.primary.sea.withOpacity(0.5) &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == Constants.hyphen &&
              widget.color == ThemeSAKS.colors.primary.sea &&
              widget.variant == TypographyVariant.h7,
        ),
        findsNothing,
      );

      final Container box = tester.widget(find.byKey(ReferralCard.cardKey));
      final BoxDecoration decoration = box.decoration! as BoxDecoration;
      expect(decoration.color, ThemeSAKS.colors.primary.sky);
    });
  });
}
