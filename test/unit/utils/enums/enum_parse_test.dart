import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("EnumParse", () {
    group("IconVariantEnum", () {
      test("should parse works correctly", () {
        final map = {
          "unicons": IconVariant.unicons,
          "custom": IconVariant.custom,
        };

        for (final key in map.keys) {
          expect(IconVariantEnum().parse(key), map[key]);
        }
      });

      test("should stringfy works correctly", () {
        final map = {
          IconVariant.unicons: "unicons",
          IconVariant.custom: "custom",
        };

        for (final key in map.keys) {
          expect(IconVariantEnum().stringfy(key), map[key]);
        }
      });
    });
  });
}
