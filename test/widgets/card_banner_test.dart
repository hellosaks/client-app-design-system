import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart";
import "package:flutter_blurhash/flutter_blurhash.dart";
import "package:flutter_test/flutter_test.dart";
import "package:skeletons/skeletons.dart";

import "../utils/test_wrappers.dart";

void main() {
  group("CardBanner", () {
    testWidgets("should render correctly border radius", (tester) async {
      final widget = CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        blurHash: "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        aspectRatio: 16 / 6,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      // border rounded
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is ClipRRect &&
              widget.borderRadius ==
                  BorderRadius.all(
                    Radius.circular(NewThemeSAKS.shape.borderRadiusCard),
                  ),
        ),
        findsOneWidget,
      );

      final widgetWithTitle = CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        blurHash: "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        aspectRatio: 16 / 6,
        onPressed: () {},
        title: "title",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widgetWithTitle));

      // border rounded
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is ClipRRect &&
              widget.borderRadius ==
                  BorderRadius.all(
                    Radius.circular(NewThemeSAKS.shape.borderRadiusCard),
                  ),
        ),
        findsOneWidget,
      );
    });

    testWidgets("should call onPressed correctly", (tester) async {
      bool pressed = false;
      final widget = CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        blurHash: "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        aspectRatio: 16 / 6,
        onPressed: () {
          pressed = true;
        },
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));
      await tester.tap(find.byType(CardBanner));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });

    testWidgets("should render title correctly", (tester) async {
      final widget = CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        blurHash: "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        aspectRatio: 16 / 6,
        onPressed: () {},
        title: "title",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "title" &&
                widget.variant == TypographyVariant.h6 &&
                widget.weight == FontWeight.w700 &&
                widget.color == NewThemeSAKS.colors.primary.sea,
          ),
          findsOneWidget);
    });

    testWidgets("should render button", (tester) async {
      onPressed() => {};
      final widget = CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        blurHash: "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        aspectRatio: 16 / 6,
        onPressed: onPressed,
        title: "title",
        buttonLabel: "ver mais",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is AuxiliarButton &&
              widget.label == "ver mais" &&
              // same onPressed function is used in card and button
              widget.onPressed == onPressed,
        ),
        findsOneWidget,
      );
    });

    testWidgets("should render skeleton in loading image", (tester) async {
      onPressed() => {};
      final widget = CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        aspectRatio: 16 / 6,
        onPressed: onPressed,
        title: "title",
        buttonLabel: "ver mais",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(AspectRatio), findsOneWidget);
      expect(find.byType(SkeletonAvatar), findsOneWidget);
    });

    testWidgets("should render blurhash in loading image", (tester) async {
      onPressed() => {};
      final widget = CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        blurHash: "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        aspectRatio: 16 / 6,
        onPressed: onPressed,
        title: "title",
        buttonLabel: "ver mais",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(AspectRatio), findsOneWidget);
      expect(find.byType(BlurHash), findsOneWidget);
    });
  });
}
