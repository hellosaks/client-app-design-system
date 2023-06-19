import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("CardBannerBuilder", () {
    test("should parse correctly", () {
      final widget = CardBannerBuilder.fromDynamic(const {
        "backgroundImage":
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_indique_amigos_01.jpg",
        "title": "Acompanhe seu bonus",
        "buttonLabel": "\${userMe['id']}",
        "blurHash": "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        "aspectRatio": 3.2
      });

      expect(
        widget.backgroundImage,
        "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_indique_amigos_01.jpg",
      );
      expect(widget.title, "Acompanhe seu bonus");
      expect(widget.buttonLabel, "\${userMe['id']}");
      expect(widget.blurHash, "L66,JcHX-oH;L4=DF5v{4:ITwGKl");
      expect(widget.aspectRatio, 16 / 5);
    });
  });
}
