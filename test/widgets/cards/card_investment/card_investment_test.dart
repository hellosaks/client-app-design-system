import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/profitability_type_enum.dart";
import "package:client_app_design_system/utils/enums/risk_type_enum.dart";
import "package:flutter/material.dart" hide Icon;
import "package:flutter_test/flutter_test.dart";
import "package:network_image_mock/network_image_mock.dart";

import "../../../utils/test_wrappers.dart";

void main() {
  group("CardInvestment", () {
    testWidgets("should render correctly", (tester) async {
      final widget = CardInvestment(
        name: "test",
        typeName: "Fundo",
        riskType: RiskType.moderate,
        riskTypeName: "Moderado",
        profitabilityName: "Rentabilidade (6m)",
        profitabilityValue: "6%",
        profitabilityIndicator: ProfitabilityIndicator.high,
        showArrow: true,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CardInvestment), findsOneWidget);
    });

    testWidgets("should onpressed call function onclick", (tester) async {
      bool pressed = false;
      final widget = CardInvestment(
        name: "test",
        typeName: "Fundo",
        riskType: RiskType.conservative,
        riskTypeName: "Moderado",
        profitabilityName: "Rentabilidade (6m)",
        profitabilityValue: "6%",
        profitabilityIndicator: ProfitabilityIndicator.high,
        showArrow: true,
        onPressed: () {
          pressed = true;
        },
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(CardInvestment));
      await tester.pump();

      expect(pressed, true);
    });

    testWidgets("should image appear in widget", (tester) async {
      final widget = CardInvestment(
        name: "test",
        typeName: "Fundo",
        riskType: RiskType.conservative,
        riskTypeName: "Moderado",
        profitabilityName: "Rentabilidade (6m)",
        profitabilityValue: "6%",
        profitabilityIndicator: ProfitabilityIndicator.high,
        showArrow: true,
        onPressed: () {},
        urlImage:
            "https://static-mobile-app-prd.s3.amazonaws.com/partner_image/badges/bagde_blackrock.png",
      );

      await mockNetworkImagesFor(
        () => tester.pumpWidget(wrapWithMaterialApp(widget)),
      );

      expect(
        find.widgetWithImage(
          CardInvestment,
          const NetworkImage(
            "https://static-mobile-app-prd.s3.amazonaws.com/partner_image/badges/bagde_blackrock.png",
          ),
        ),
        findsOneWidget,
      );
    });

    group("RiskType color", () {
      testWidgets("should risktype conservative color is bay", (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.conservative,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.high,
          showArrow: true,
          onPressed: () {},
        );

        expect(widget.colorForRiskType, ThemeSAKS.colors.secondary.bay);
      });

      testWidgets("should risktype moderate color is moderate", (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.moderate,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.high,
          showArrow: true,
          onPressed: () {},
        );

        expect(widget.colorForRiskType, ThemeSAKS.colors.utility.moderate);
      });

      testWidgets("should risktype aggressive color is aggressive",
          (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.aggressive,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.high,
          showArrow: true,
          onPressed: () {},
        );

        expect(widget.colorForRiskType, ThemeSAKS.colors.utility.aggressive);
      });
    });

    group("ProfitabilityIndicator color", () {
      testWidgets("should profitability high color is conservative",
          (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.moderate,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.high,
          showArrow: true,
          onPressed: () {},
        );

        expect(
          widget.colorForProfitabilityIndicator,
          ThemeSAKS.colors.utility.conservative,
        );
      });

      testWidgets("should profitability zero color is strongGrey",
          (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.moderate,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.zero,
          showArrow: true,
          onPressed: () {},
        );

        expect(
          widget.colorForProfitabilityIndicator,
          ThemeSAKS.colors.grayscale.strongGrey,
        );
      });

      testWidgets("should profitability low color is moderate", (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.moderate,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.low,
          showArrow: true,
          onPressed: () {},
        );

        expect(
          widget.colorForProfitabilityIndicator,
          ThemeSAKS.colors.utility.moderate,
        );
      });
    });

    group("ProfitabilityIndicator icon", () {
      testWidgets("should profitability high icon is up", (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.moderate,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.high,
          showArrow: true,
          onPressed: () {},
        );

        final Icon icon = widget.iconForProfitabilityIndicator as Icon;

        expect(
          icon.props.uniconsProps!.icon,
          UniconsLine.angle_up,
        );
      });

      testWidgets("should profitability zero icon is sizedbox", (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.moderate,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.zero,
          showArrow: true,
          onPressed: () {},
        );

        final SizedBox icon = widget.iconForProfitabilityIndicator as SizedBox;

        expect(icon.runtimeType, SizedBox);
      });

      testWidgets("should profitability low icon is down", (tester) async {
        final widget = CardInvestment(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.moderate,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.low,
          showArrow: true,
          onPressed: () {},
        );

        final Icon icon = widget.iconForProfitabilityIndicator as Icon;

        expect(
          icon.props.uniconsProps!.icon,
          UniconsLine.angle_down,
        );
      });
    });
  });
}
