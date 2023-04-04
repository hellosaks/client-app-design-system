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
            size: 24,
          ),
        ),
        color: Colors.black,
      );

      expect(icon.customIconsProps, null);
      expect(icon.uniconsProps, null);

      expect(icon.variant, IconVariant.heroicons);
      expect(icon.heroIconsProps?.color, Colors.black);
      expect(icon.heroIconsProps?.size, 24);
      expect(
        icon.heroIconsProps != null,
        true,
      );
    });
    test("should return unicons icons", () {
      final icon = iconProps(
        variant: IconVariant.unicons,
        props: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.adjust,
            size: 24,
          ),
        ),
        color: Colors.black,
      );

      expect(icon.heroIconsProps, null);
      expect(icon.customIconsProps, null);

      expect(icon.uniconsProps?.color, Colors.black);
      expect(icon.uniconsProps?.size, 24);
      expect(
        icon.uniconsProps != null,
        true,
      );
      expect(icon.variant, IconVariant.unicons);
    });
    test("should return custom icon props", () {
      final icon = iconProps(
        variant: IconVariant.custom,
        props: IconProps(
          variant: IconVariant.custom,
          customIconsProps: CustomIconsProps(
            icon: CustomIcons.icShare,
            size: 24,
          ),
        ),
        color: Colors.black,
      );

      expect(icon.heroIconsProps, null);
      expect(icon.uniconsProps, null);

      expect(icon.customIconsProps?.size, 24);
      expect(icon.customIconsProps?.color, Colors.black);
      expect(
        icon.customIconsProps != null,
        true,
      );
    });
  });
}
