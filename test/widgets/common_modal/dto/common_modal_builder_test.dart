import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("CommonModalBuilder", () {
    testWidgets("should return component after build", (tester) async {
      final widget = CommonModalBuilder.fromDynamic(const {
        "title": "title test",
        "description": "description test",
        "currentIconProps": {
          "variant": "custom",
          "customIconsProps": {
            "color": "#ccccdd",
            "size": 25,
            "icon": "icMultimedia"
          }
        },
        "modalHeight": 320,
        "loading": true,
      });

      expect(widget.currentIconProps.runtimeType, IconProps);
      expect(widget.description, "description test");
      expect(widget.title, "title test");
      expect(widget.modalHeight, 320);
      expect(widget.loading, true);
    });
  });
}
