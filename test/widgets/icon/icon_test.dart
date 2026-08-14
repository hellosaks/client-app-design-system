import "package:client_app_design_system/client_app_design_system.dart";
import "package:material_ui/material_ui.dart" as material show Colors, Icon;
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  group("Icon", () {
    testWidgets("should render unicons", (tester) async {
      final widget = Icon(
        props: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsSolid.airplay,
          ),
        ),
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(material.Icon), findsOneWidget);
    });

    testWidgets("should render custom icons", (tester) async {
      final widget = Icon(
        props: IconProps(
          variant: IconVariant.custom,
          customIconsProps: CustomIconsProps(
            icon: CustomIcons.icWhatsapp,
          ),
        ),
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets("should aseert is throw", (tester) async {
      // throws assertion error to unicons
      expect(
        () {
          Icon(
            props: IconProps(
              variant: IconVariant.unicons,
              customIconsProps: CustomIconsProps(
                icon: CustomIcons.icMultimedia,
              ),
            ),
          );
        },
        throwsAssertionError,
      );

      // throws assertion error to custom icons
      expect(
        () {
          Icon(
            props: IconProps(
              variant: IconVariant.custom,
              uniconsProps: UniconsProps(
                icon: UniconsSolid.airplay,
              ),
            ),
          );
        },
        throwsAssertionError,
      );
    });
  });

  group("Icon props copyWith", () {
    test("should return unicons icons", () {
      final icon = IconProps(
        variant: IconVariant.unicons,
        uniconsProps: UniconsProps(
          icon: UniconsLine.adjust,
          size: 24,
        ),
      ).copyWith(color: material.Colors.black);

      expect(icon.customIconsProps, null);

      expect(icon.uniconsProps != null, true);
      expect(icon.uniconsProps?.color, material.Colors.black);
      expect(icon.uniconsProps?.size, 24);
    });

    test("should return custom icon props", () {
      final icon = IconProps(
        variant: IconVariant.custom,
        customIconsProps: CustomIconsProps(
          icon: CustomIcons.icShare,
          size: 24,
        ),
      ).copyWith(color: material.Colors.amber, size: 20);

      expect(icon.uniconsProps, null);

      expect(icon.customIconsProps != null, true);
      expect(icon.customIconsProps?.size, 20);
      expect(icon.customIconsProps?.color, material.Colors.amber);
    });
  });
}
