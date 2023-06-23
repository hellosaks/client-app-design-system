import "package:client_app_design_system/client_app_design_system.dart"
    hide DropdownValue;
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  group("CircularLoading", () {
    testWidgets("should render correctly for android",
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      const widget = CircularLoading();
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CircularLoading), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(CupertinoActivityIndicator), findsNothing);

      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets("should render correctly for IOS", (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      const widget = CircularLoading();
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CircularLoading), findsOneWidget);
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CircularProgressIndicator &&
              widget.backgroundColor == Colors.black,
        ),
        findsOneWidget,
      );

      debugDefaultTargetPlatformOverride = null;
    });
  });
}
