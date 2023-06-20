import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("SkeletonBuilder", () {
    test("should parse correctly infos", () {
      final skeleton = SkeletonBuilder.fromDynamic(
        const {"height": 300, "width": 200, "radius": 40},
      );
      expect(skeleton.width, 200);
      expect(skeleton.height, 300);
      expect(skeleton.radius, 40);
    });
  });
}
