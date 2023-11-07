import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

import "../../../../utils/test_wrappers.dart";

void main() {
  group("CardInvestmentBuilder", () {
    late final JsonWidgetRegistry registry;

    setUp(() {
      registry = JsonWidgetRegistry.instance;
      bindComponents(registry, mapBuilders);
    });

    testWidgets("should parse correctly", (tester) async {
      final jsonArgs = {
        "name": "test",
        "typeName": "Fundo",
        "riskType": "conservative",
        "riskTypeName": "Moderado",
        "profitabilityName": "Rentabilidade (6m)",
        "profitabilityValue": "6%",
        "profitabilityIndicator": "high",
        "showArrow": true,
        "onPressed": "\${noop()}"
      };
      final jsonComponent = {
        "type": "card_investment",
        "args": {...jsonArgs}
      };

      await tester.pumpWidget(wrapWithJsonBuilder(jsonComponent, registry));

      expect(find.byType(CardInvestment), findsOneWidget);

      final widget = tester.widget<CardInvestment>(find.byType(CardInvestment));

      expect(
        widget.props,
        const CardInvestmentProps(
          name: "test",
          typeName: "Fundo",
          riskType: RiskType.conservative,
          riskTypeName: "Moderado",
          profitabilityName: "Rentabilidade (6m)",
          profitabilityValue: "6%",
          profitabilityIndicator: ProfitabilityIndicator.high,
          showArrow: true,
        ),
      );
    });
  });
}
