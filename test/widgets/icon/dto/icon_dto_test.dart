import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/icon/dto/icon_dto.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("UniconsPropsDto", () {
    test("should return uniconsProps correctly fromJsom method", () {
      final uniconsProps = UniconsPropsDto()
          .fromJson({"color": "#cccccc", "size": 20, "icon": "zero_plus"});
      expect(uniconsProps.color, const Color(0xffcccccc));
      expect(uniconsProps.size, 20);
      expect(uniconsProps.icon, UniconsLine.zero_plus);
    });
  });

  group("CustomIconsPropsDto", () {
    test("should return customIconsProps correctly fromJsom method", () {
      final customIconsProps = CustomIconsPropsDto()
          .fromJson({"color": "#ccccdd", "size": 25, "icon": "icMultimedia"});
      expect(customIconsProps.color, const Color(0xffccccdd));
      expect(customIconsProps.size, 25);
      expect(customIconsProps.icon, CustomIcons.icMultimedia);
    });
  });

  group("IconPropsDto", () {
    test("should return iconPropsDto correctly fromJsom method", () {
      final uniconsProps = IconPropsDto().fromJson({
        "variant": "unicons",
        "uniconsProps": {
          "color": "#cccccc",
          "size": 20,
          "icon": "zero_plus",
        }
      });

      expect(uniconsProps.variant, IconVariant.unicons);
      expect(uniconsProps.uniconsProps != null, true);

      final customIconsProps = IconPropsDto().fromJson({
        "variant": "custom",
        "customIconsProps": {
          "color": "#ccccdd",
          "size": 25,
          "icon": "icMultimedia"
        }
      });

      expect(customIconsProps.variant, IconVariant.custom);
      expect(customIconsProps.customIconsProps != null, true);
    });
  });
}
