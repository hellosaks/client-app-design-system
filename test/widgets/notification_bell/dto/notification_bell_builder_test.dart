import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

import "../../../utils/test_wrappers.dart";

void main() {
  group("NotificationBellBuilder", () {
    late final JsonWidgetRegistry registry;

    setUp(() {
      registry = JsonWidgetRegistry.instance;
      bindComponents(registry, mapBuilders);
    });

    testWidgets("should parse correctly infos", (tester) async {
      final jsonArgs = {
        "number_notifications": 1,
        "icon_props": {
          "variant": "unicons",
          "uniconsProps": {
            "color": "#131C2F",
            "icon": "bell",
          }
        }
      };
      final jsonComponent = {
        "type": NotificationBellBuilder.type,
        "args": {...jsonArgs}
      };

      await tester.pumpWidget(wrapWithJsonBuilder(jsonComponent, registry));

      expect(find.byType(NotificationBell), findsOneWidget);

      final widget =
          tester.widget<NotificationBell>(find.byType(NotificationBell));

      expect(widget.numberOfNotifications, 1);
      expect(widget.iconProps.runtimeType, IconProps);
    });
  });
}
