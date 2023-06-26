import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:json_theme/json_theme.dart";

void main() {
  group("CustomDivider", () {
    test("should parse correctly infos", () {
      final json = {"color": "#FFF"};
      final CustomDividerBuilder widget =
          CustomDividerBuilder.fromDynamic(json);

      expect(widget.color, ThemeDecoder.decodeColor("#FFF"));
    });
  });
}
