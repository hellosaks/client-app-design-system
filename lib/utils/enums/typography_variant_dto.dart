import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/enums_dto.dart";

class TypographyVariantEnum implements EnumDto<TypographyVariant> {
  @override
  TypographyVariant parse(String enumType) {
    switch (enumType) {
      case "h1":
        return TypographyVariant.h1;
      case "h2":
        return TypographyVariant.h2;
      case "h3":
        return TypographyVariant.h3;
      case "h4":
        return TypographyVariant.h4;
      case "h5":
        return TypographyVariant.h5;
      case "h6":
        return TypographyVariant.h6;
      case "h7":
        return TypographyVariant.h7;
      case "cta":
        return TypographyVariant.cta;
      case "underline":
        return TypographyVariant.underline;
      case "strikethrough":
        return TypographyVariant.strikethrough;
    }

    return TypographyVariant.cta;
  }

  @override
  String stringfy(TypographyVariant enumType) {
    switch (enumType) {
      case TypographyVariant.h1:
        return "h1";
      case TypographyVariant.h2:
        return "h2";
      case TypographyVariant.h3:
        return "h3";
      case TypographyVariant.h4:
        return "h4";
      case TypographyVariant.h5:
        return "h5";
      case TypographyVariant.h6:
        return "h6";
      case TypographyVariant.h7:
        return "h7";
      case TypographyVariant.cta:
        return "cta";
      case TypographyVariant.underline:
        return "underline";
      case TypographyVariant.strikethrough:
        return "strikethrough";
    }
  }
}
