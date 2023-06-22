import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

import "../../../utils/test_wrappers.dart";

void main() {
  group("IconBuilder", () {
    late final JsonWidgetRegistry registry;

    setUp(() {
      registry = JsonWidgetRegistry.instance;
      bindComponents(registry, mapBuilders);
    });

    testWidgets("should return component after build", (tester) async {
      final jsonArgs = {
        "props": {
          "variant": "unicons",
          "uniconsProps": {"color": "#ccccdd", "size": 25, "icon": "three_plus"}
        }
      };
      final jsonComponent = {
        "type": IconBuilder.type,
        "args": {...jsonArgs}
      };

      await tester.pumpWidget(wrapWithJsonBuilder(jsonComponent, registry));

      expect(find.byType(Icon), findsOneWidget);
    });
  });
}
