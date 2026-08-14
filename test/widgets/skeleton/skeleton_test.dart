import "package:client_app_design_system/client_app_design_system.dart";
import "package:material_ui/material_ui.dart";
import "package:flutter_test/flutter_test.dart";
import "package:shimmer/shimmer.dart";

import "../../utils/test_wrappers.dart";

void main() {
  group("Skeleton", () {
    testWidgets("should render shimmer effect", (tester) async {
      const widget = Skeleton(height: 200);

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(Shimmer), findsOneWidget);
    });

    testWidgets("should render shimmer effect with default borderRadius",
        (tester) async {
      const widget = Skeleton(height: 200);

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              (widget.decoration! as BoxDecoration).borderRadius ==
                  BorderRadius.circular(ThemeSAKS.shape.borderRadiusCard),
        ),
        findsOneWidget,
      );
    });

    testWidgets("should render shimmer effect with borderRadius",
        (tester) async {
      const widget = Skeleton(height: 200, radius: 20);

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              (widget.decoration! as BoxDecoration).borderRadius ==
                  BorderRadius.circular(20),
        ),
        findsOneWidget,
      );
    });
  });
}
