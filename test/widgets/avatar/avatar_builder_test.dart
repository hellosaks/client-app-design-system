import "package:client_app_design_system/components/avatar/avatar_builder.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Avatar builder", () {
    test("should return default component", () {
      const json = {};

      final AvatarBuilder component = AvatarBuilder.fromDynamic(json);

      expect(component, isInstanceOf<AvatarBuilder>());
      expect(component.radius, 25);
    });
    test("should return correct component", () {
      const json = {
        "radius": 22,
        "image_url": "https://picsum.photos/250?image=9"
      };

      final AvatarBuilder component = AvatarBuilder.fromDynamic(json);

      expect(component, isInstanceOf<AvatarBuilder>());
      expect(component.radius, 22);
    });
  });
}
