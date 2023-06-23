import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

import "../../../utils/test_wrappers.dart";

void main() {
  group("CommonModalBuilder", () {
    late final JsonWidgetRegistry registry;

    setUp(() {
      registry = JsonWidgetRegistry.instance;
      bindComponents(registry, mapBuilders);
    });

    testWidgets("should return component after build", (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      final jsonArgs = {
        "title": "title test",
        "description": "description test",
        "currentIconProps": {
          "variant": "unicons",
          "uniconsProps": {"color": "#ccccdd", "size": 25, "icon": "three_plus"}
        },
        "modalHeight": 320,
        "loading": true,
        "onPressButton": {"title": "title test", "onPressed": "\${noop()}"},
        "onCloseButton": {"title": "title test", "onPressed": "\${noop()}"},
        "tertiaryButton": {"title": "title test", "onPressed": "\${noop()}"},
      };
      final jsonComponent = {
        "type": "common_modal",
        "args": {...jsonArgs}
      };

      await tester.pumpWidget(wrapWithJsonBuilder(jsonComponent, registry));

      expect(find.byType(CommonModal), findsOneWidget);

      final widget = tester.widget<CommonModal>(find.byType(CommonModal));

      expect(widget.currentIconProps.runtimeType, IconProps);
      expect(widget.description, "description test");
      expect(widget.title, "title test");
      expect(widget.modalHeight, 320);
      expect(widget.loading, true);
    });
  });
}
