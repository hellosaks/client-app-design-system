import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("CustomIconEnum", () {
    test("should parse works correctly", () {
      final map = {
        "icWhatsapp": CustomIcons.icWhatsapp,
        "icShare": CustomIcons.icShare,
        "icMultimedia": CustomIcons.icMultimedia
      };

      for (final key in map.keys) {
        expect(CustomIconEnum().parse(key), map[key]);
      }
    });

    test("should stringfy works correctly", () {
      final map = {
        CustomIcons.icWhatsapp: "icWhatsapp",
        CustomIcons.icShare: "icShare",
        CustomIcons.icMultimedia: "icMultimedia",
      };

      for (final key in map.keys) {
        expect(CustomIconEnum().stringfy(key), map[key]);
      }
    });
  });
}
