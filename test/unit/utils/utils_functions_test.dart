import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/util_functions.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Short link", () {
    test("should return correct link", () {
      const String link = "https://www.google.com";

      expect(shortLink(link), "www.google.com");

      const String longLink = "https://github.com/hellosaks/";

      expect(shortLink(longLink), "github.com...hellosaks/");

      const linkWith20char = "https://github.com/hellosaks";
      expect(shortLink(linkWith20char), "github.com.../hellosaks");
    });
  });

  group("Icon props", () {
    test("should return variant heroicons", () {
      final icon = iconProps(
        variant: IconVariant.heroicons,
        props: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.archiveBox,
          ),
        ),
        color: Colors.black,
      );

      expect(icon.customIconsProps, null);
      expect(icon.uniconsProps, null);

      expect(
        icon.heroIconsProps != null,
        true,
      );
    });
    test("should return heroicons", () {
      final icon = iconProps(
        variant: IconVariant.unicons,
        props: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.adjust,
          ),
        ),
        color: Colors.black,
      );

      expect(icon.heroIconsProps, null);
      expect(icon.customIconsProps, null);

      expect(
        icon.uniconsProps != null,
        true,
      );
    });
    test("should return custom", () {
      final icon = iconProps(
        variant: IconVariant.custom,
        props: IconProps(
          variant: IconVariant.custom,
          customIconsProps: CustomIconsProps(
            icon: CustomIcons.icShare,
          ),
        ),
        color: Colors.black,
      );

      expect(icon.heroIconsProps, null);
      expect(icon.uniconsProps, null);

      expect(
        icon.customIconsProps != null,
        true,
      );
    });
  });
}
