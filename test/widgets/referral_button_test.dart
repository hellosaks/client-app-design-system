import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/services.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mix/mix.dart";
import "package:mix/src/dto/border_radius.dto.dart";

import "../utils/test_wrappers.dart";

void main() {
  group("ReferralButton", () {
    testWidgets("should render correctly", (tester) async {
      final widget = ReferralButton(
        onCopy: (link) {},
        title: "Link de Indicação",
        linkToCopy: "https://linked.hellosaks.com/referrals/XmCo",
        feedbackOnCopy: "Link copiado!",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(ReferralButton), findsOneWidget);
      expect(find.byType(Pressable), findsOneWidget);

      // verify title
      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "Link de Indicação" &&
                widget.color == ThemeSAKS.colors.primary.sky &&
                widget.variant == TypographyVariant.h4,
          ),
          findsOneWidget,);

      // verify linkToCopy
      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "linked.hel...rrals/XmCo" &&
                widget.color == ThemeSAKS.colors.primary.sky &&
                widget.variant == TypographyVariant.h6,
          ),
          findsOneWidget,);

      // verify icon
      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.props.heroIconsProps!.icon ==
                    HeroIcons.clipboardDocument &&
                widget.props.heroIconsProps!.size == 30 &&
                widget.props.heroIconsProps!.color ==
                    ThemeSAKS.colors.primary.sky,
          ),
          findsOneWidget,);

      // verify styles for container box
      final Box containerWidget =
          tester.widget(find.byKey(ReferralButton.containerKey));
      final List<Attribute> containerAttributes =
          containerWidget.mix.attributes;
      expect(
        (containerAttributes[0] as BoxAttributes).color,
        ThemeSAKS.colors.primary.saks,
      );
      expect(
        (containerAttributes[4] as BoxAttributes).borderRadius,
        BorderRadiusDto.all(ThemeSAKS.shape.borderRadiusCard),
      );
    });

    group("tag feedback", () {
      testWidgets("should render correctly", (tester) async {
        final widget = ReferralButton(
          onCopy: (link) {},
          title: "Link de Indicação",
          linkToCopy: "aalinked.hellosaks.com/referrals/XmCo",
          feedbackOnCopy: "Link copiado!",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byKey(ReferralButton.tagFeedbackKey), findsOneWidget);

        final Box tagFeedbackWidget =
            tester.widget(find.byKey(ReferralButton.tagFeedbackKey));
        final List<Attribute> tagStyleAttributes =
            tagFeedbackWidget.mix.attributes;

        expect(
          (tagStyleAttributes[0] as BoxAttributes).color,
          ThemeSAKS.colors.utility.conservative,
        );
        expect((tagStyleAttributes[4] as OpacityDecorator).opacity, 0);
        expect(
          (tagStyleAttributes[3] as BoxAttributes).borderRadius,
          BorderRadiusDto.all(ThemeSAKS.shape.borderRadius),
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.color == ThemeSAKS.colors.primary.sky &&
                widget.weight == FontWeight.w500 &&
                widget.variant == TypographyVariant.h6,
          ),
          findsOneWidget,
        );
      });

      testWidgets("should change opacity onclick", (tester) async {
        final widget = ReferralButton(
          onCopy: (link) {},
          title: "Link de Indicação",
          linkToCopy: "linked.hellosaks.com/referrals/XmCo",
          feedbackOnCopy: "Link copiado!",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        // change opacity on click
        await tester.tap(find.byType(ReferralButton));
        await tester.pumpAndSettle();

        final Box tagFeedbackWidget =
            tester.widget(find.byKey(ReferralButton.tagFeedbackKey));
        final List<Attribute> tagStyleAttributes =
            tagFeedbackWidget.mix.attributes;

        expect((tagStyleAttributes[4] as OpacityDecorator).opacity, 1);

        // wait for animation to finish
        await tester.pumpAndSettle(const Duration(seconds: 2));
      });

      testWidgets("should onCopy function called", (tester) async {
        bool pressed = false;
        final widget = ReferralButton(
          onCopy: (link) {
            expect(link, "linked.hellosaks.com/referrals/XmCo");
            pressed = true;
          },
          title: "Link de Indicação",
          linkToCopy: "linked.hellosaks.com/referrals/XmCo",
          feedbackOnCopy: "Link copiado!",
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        // change opacity on click
        await tester.tap(find.byType(ReferralButton));
        await tester.pumpAndSettle();

        expect(pressed, true);

        // wait for animation to finish
        await tester.pumpAndSettle(const Duration(seconds: 2));
      });
    });
  });
}
