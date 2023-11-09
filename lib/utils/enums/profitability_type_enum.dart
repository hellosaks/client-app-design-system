import "package:client_app_design_system/utils/enums/enums_dto.dart";

enum ProfitabilityIndicator { low, zero, high }

class ProfitabilityIndicatorEnum implements EnumDto<ProfitabilityIndicator> {
  @override
  ProfitabilityIndicator parse(String enumType) {
    switch (enumType) {
      case "low":
        return ProfitabilityIndicator.low;
      case "zero":
        return ProfitabilityIndicator.zero;
      case "high":
        return ProfitabilityIndicator.high;
      default:
        return ProfitabilityIndicator.zero;
    }
  }

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
}
