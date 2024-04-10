import "package:client_app_design_system/utils/enums/enums_dto.dart";

enum ProfitabilityIndicator { low, zero, high }

class ProfitabilityIndicatorEnum extends EnumDto<ProfitabilityIndicator> {
  @override
  String stringfy(ProfitabilityIndicator enumType) {
    switch (enumType) {
      case ProfitabilityIndicator.low:
        return "low";
      case ProfitabilityIndicator.zero:
        return "zero";
      case ProfitabilityIndicator.high:
        return "high";
    }
  }

  @override
  ProfitabilityIndicator? canParse(String enumType) {
    switch (enumType) {
      case "low":
        return ProfitabilityIndicator.low;
      case "zero":
        return ProfitabilityIndicator.zero;
      case "high":
        return ProfitabilityIndicator.high;
    }
    return null;
  }

  @override
  ProfitabilityIndicator get defaultEnum => ProfitabilityIndicator.zero;
}
