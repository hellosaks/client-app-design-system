import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("SvgBuilder", () {
    test("should parse correctly infos", () {
      final json = {"asset": "asset", "height": 200, "width": 40};
      final SvgBuilder svg = SvgBuilder.fromDynamic(json);

      expect(svg.asset, "asset");
      expect(svg.height, 200);
      expect(svg.width, 40);
    });
  });
}
