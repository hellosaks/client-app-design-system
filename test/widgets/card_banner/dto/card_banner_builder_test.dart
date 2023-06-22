import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

import "../../../utils/test_wrappers.dart";

void main() {
  group("CardBannerBuilder", () {
    late final JsonWidgetRegistry registry;

    setUp(() {
      registry = JsonWidgetRegistry.instance;
      bindComponents(registry, mapBuilders);
    });

    testWidgets("should parse correctly", (tester) async {
      final jsonArgs = {
        "backgroundImage":
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_indique_amigos_01.jpg",
        "title": "Acompanhe seu bonus",
        "buttonLabel": "Test label",
        "blurHash": "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        "aspectRatio": 3.2,
        "onPressed": "\${noop()}"
      };
      final jsonComponent = {
        "type": "card_banner",
        "args": {...jsonArgs}
      };

      await tester.pumpWidget(wrapWithJsonBuilder(jsonComponent, registry));

      expect(find.byType(CardBanner), findsOneWidget);

      final widget = tester.widget<CardBanner>(find.byType(CardBanner));

      expect(
        widget.backgroundImage,
        "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_indique_amigos_01.jpg",
      );
      expect(widget.title, "Acompanhe seu bonus");
      expect(widget.buttonLabel, "Test label");
      expect(widget.blurHash, "L66,JcHX-oH;L4=DF5v{4:ITwGKl");
      expect(widget.aspectRatio, 16 / 5);
    });
  });
}
