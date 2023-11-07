import 'package:client_app_design_system/components/cards/card_investment/card_investment.dart';
import 'package:client_app_design_system/components/cards/card_investment/card_investment.doc_widget.dart';
import 'package:client_app_design_system/utils/enums/enums.dart';
import 'package:doc_widget/doc_widget.dart';

final cardInvestmentDoc = ElementPreview(
  document: CardInvesmentDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const CardInvesment(
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
      ),
      description: 'Example card investment',
    ),
    WidgetPreview(
      widget: const CardInvesment(
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
      widget: const CardInvesment(
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
  ],
);
