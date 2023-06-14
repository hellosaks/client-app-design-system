import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/icon/dto/icon_builder.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("IconBuilder", () {
    testWidgets("should return component after build", (tester) async {
      final widget = IconBuilder.fromDynamic(const {
        "props": {
          "variant": "custom",
          "customIconsProps": {
            "color": "#ccccdd",
            "size": 25,
            "icon": "icMultimedia"
          }
        }
      });

      expect(widget.props.runtimeType, IconProps);
    });
  });
}
