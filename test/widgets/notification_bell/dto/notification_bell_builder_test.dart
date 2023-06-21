import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("NotificationBellBuilder", () {
    test("should parse correctly infos", () {
      final json = {
        "number_notification": 1,
        "icon_props": {
          "variant": "unicons",
          "uniconsProps": {
            "color": "#131C2F",
            "icon": "bell",
          }
        }
      };
      final NotificationBellBuilder widget =
          NotificationBellBuilder.fromDynamic(json);

      expect(widget.numberNotifications, 1);
      expect(
        widget.iconProps.variant,
        IconVariant.unicons,
      );

      expect(
        widget.iconProps.variant,
        IconVariant.unicons,
      );

      expect(
        widget.iconProps.uniconsProps?.icon,
        UniconsLine.bell,
      );
    });
  });
}
