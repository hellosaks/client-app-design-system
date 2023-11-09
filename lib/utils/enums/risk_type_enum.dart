import "package:client_app_design_system/utils/enums/enums_dto.dart";

enum RiskType { conservative, moderate, aggressive }

class RiskTypeEnum extends EnumDto<RiskType> {
  @override
  RiskType parse(String enumType) {
    switch (enumType) {
      case "conservative":
        return RiskType.conservative;
      case "moderate":
        return RiskType.moderate;
      case "aggressive":
        return RiskType.aggressive;
      default:
        return RiskType.conservative;
    }
  }

  @override
  String stringfy(RiskType enumType) {
    switch (enumType) {
      case RiskType.conservative:
        return "conservative";
      case RiskType.moderate:
        return "moderate";
      case RiskType.aggressive:
        return "aggressive";
    }
  }
}
