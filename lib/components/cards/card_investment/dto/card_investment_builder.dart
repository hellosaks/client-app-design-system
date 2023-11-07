import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/profitability_type_parse_dto.dart";
import "package:client_app_design_system/utils/enums/risk_type_parse_dto.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CardInvestmentBuilder extends JsonWidgetBuilder {
  final String name;
  final String typeName;
  final RiskType riskType;
  final String riskTypeName;

  final String profitabilityName;
  final String profitabilityValue;
  final ProfitabilityIndicator profitabilityIndicator;

  final bool showArrow;
  final String? urlImage;
  final void Function()? onPressed;

  const CardInvestmentBuilder({
    required super.numSupportedChildren,
    required this.name,
    required this.typeName,
    required this.riskType,
    required this.riskTypeName,
    required this.profitabilityName,
    required this.profitabilityValue,
    required this.profitabilityIndicator,
    this.showArrow = false,
    this.urlImage,
    this.onPressed,
  });

  static const type = "card_investment";

  factory CardInvestmentBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    final void Function()? onPressed = json["onPressed"] as void Function()?;

    return CardInvestmentBuilder(
      numSupportedChildren: 0,
      name: pick(json, "name").asStringOrThrow(),
      typeName: pick(json, "typeName").asStringOrThrow(),
      profitabilityName: pick(json, "profitabilityName").asStringOrThrow(),
      profitabilityValue: pick(json, "profitabilityValue").asStringOrThrow(),
      riskTypeName: pick(json, "riskTypeName").asStringOrThrow(),
      showArrow: pick(json, "showArrow").asBoolOrFalse(),
      urlImage: pick(json, "urlImage").asStringOrNull(),
      profitabilityIndicator: pick(json, "profitabilityIndicator").letOrThrow(
        (p0) => ProfitabilityIndicatorEnum().parse(p0.asString()),
      ),
      riskType: pick(json, "riskType").letOrThrow(
        (p0) => RiskTypeEnum().parse(p0.asString()),
      ),
      onPressed: onPressed,
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return CardInvestment(
      key: key,
      props: CardInvestmentProps(
        name: name,
        profitabilityIndicator: profitabilityIndicator,
        profitabilityName: profitabilityName,
        profitabilityValue: profitabilityValue,
        riskType: riskType,
        riskTypeName: riskTypeName,
        typeName: typeName,
        onPressed: onPressed,
        showArrow: showArrow,
        urlImage: urlImage,
      ),
    );
  }
}
