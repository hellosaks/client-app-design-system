import 'dart:convert';

import 'package:client_app_design_system/components/cards/card_investment/card_investment.dart';
import 'package:client_app_design_system/components/cards/card_investment/card_investment.doc_widget.dart';
import 'package:client_app_design_system/utils/enums/profitability_type_enum.dart';
import 'package:client_app_design_system/utils/enums/risk_type_enum.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:playground/render_service.dart';

class JsonCardInvestment extends StatelessWidget {
  const JsonCardInvestment({super.key});

  @override
  Widget build(BuildContext context) {
    return RenderService().buildJson(
      json: jsonEncode({
        "type": "card_investment",
        "args": {
          "name": "test",
          "type_name": "Fundo",
          "risk_type": "conservative",
          "risk_type_name": "Moderado",
          "profitability_name": "Rentabilidade (6m)",
          "profitability_value": "6%",
          "profitability_indicator": "high",
          "show_arrow": true,
          "on_pressed": "\${noop()}",
          "url_image":
              "https://static-mobile-app-prd.s3.amazonaws.com/partner_image/badges/bagde_blackrock.png",
        }
      }),
      context: context,
    );
  }
}

final cardInvestmentDoc = ElementPreview(
  document: CardInvestmentDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: CardInvestment(
        name: "SulAmérica Prestige Strategie FIC FI RF CP",
        profitabilityIndicator: ProfitabilityIndicator.high,
        profitabilityName: "Rentabilidade (12 m)",
        profitabilityValue: "7,97%",
        riskType: RiskType.moderate,
        riskTypeName: "Moderado",
        typeName: "Fundo",
        showArrow: true,
        urlImage:
            "https://static-mobile-app-prd.s3.amazonaws.com/partner_image/badges/bagde_blackrock.png",
        onPressed: () {},
      ),
      description: 'Example card investment',
    ),
    WidgetPreview(
      widget: const CardInvestment(
        name: "SulAmérica Prestige Strategie FIC FI RF CP",
        profitabilityIndicator: ProfitabilityIndicator.low,
        profitabilityName: "Rentabilidade (12 m)",
        profitabilityValue: "-7,97%",
        riskType: RiskType.conservative,
        riskTypeName: "Conservador",
        typeName: "Fundo",
      ),
      description: 'Example card investment without arrow',
    ),
    WidgetPreview(
      widget: const CardInvestment(
        name: "SulAmérica Prestige Strategie FIC FI RF CP",
        profitabilityIndicator: ProfitabilityIndicator.zero,
        profitabilityName: "Rentabilidade (12 m)",
        profitabilityValue: "0%",
        riskType: RiskType.aggressive,
        riskTypeName: "Conservador",
        typeName: "Fundo",
      ),
      description: 'Example card investment with zero profitability',
    ),
    WidgetPreview(
      widget: const JsonCardInvestment(),
      description: 'Example card investment from JSON build',
    ),
  ],
);
