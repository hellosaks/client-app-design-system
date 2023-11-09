import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/profitability_type_enum.dart";
import "package:client_app_design_system/utils/enums/risk_type_enum.dart";
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
        "type_name": "Fundo",
        "risk_type": "conservative",
        "risk_type_name": "Moderado",
        "profitability_name": "Rentabilidade (6m)",
        "profitability_value": "6%",
        "profitability_indicator": "high",
        "show_arrow": true,
        "on_pressed": "\${noop()}",
      };
      final jsonComponent = {
        "type": "card_investment",
        "args": {...jsonArgs}
      };

      await tester.pumpWidget(wrapWithJsonBuilder(jsonComponent, registry));

      expect(find.byType(CardInvestment), findsOneWidget);

      final widget = tester.widget<CardInvestment>(find.byType(CardInvestment));

      expect(widget.name, "test");
      expect(widget.typeName, "Fundo");
      expect(widget.riskType, RiskType.conservative);
      expect(widget.riskTypeName, "Moderado");
      expect(widget.profitabilityName, "Rentabilidade (6m)");
      expect(widget.profitabilityValue, "6%");
      expect(widget.profitabilityIndicator, ProfitabilityIndicator.high);
      expect(widget.showArrow, true);
    });
  });
}
