import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_ui/material_ui.dart" hide Icon;

import "../../utils/test_wrappers.dart";

void main() {
  group("NotificationBell", () {
    testWidgets("is shown", (WidgetTester tester) async {
      // GIVEN
      final widget = NotificationBell(
        numberOfNotifications: 0,
        onPressed: () {},
        iconProps: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.bell,
          ),
        ),
      );

      // WHEN
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      // THEN
      expect(find.byType(NotificationBell), findsOneWidget);
    });

    testWidgets("should render badge when there is notifications",
        (WidgetTester tester) async {
      // GIVEN
      const notifications = 1;
      final widget = NotificationBell(
        numberOfNotifications: notifications,
        onPressed: () {},
        iconProps: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.bell,
          ),
        ),
      );

      // WHEN
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      // THEN
      expect(find.byKey(Key(NotificationBell.badgeKey)), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Icon &&
              widget.props.uniconsProps?.icon == UniconsLine.bell,
        ),
        findsOneWidget,
      );
      expect(find.text(notifications.toString()), findsOneWidget);
    });

    testWidgets("should render the number of clipped notifications",
        (WidgetTester tester) async {
      // GIVEN
      const notifications = 200;
      final widget = NotificationBell(
        numberOfNotifications: notifications,
        onPressed: () {},
        iconProps: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.bell,
          ),
        ),
      );

      // WHEN
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      // THEN
      expect(find.byKey(Key(NotificationBell.badgeKey)), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Icon &&
              widget.props.uniconsProps?.icon == UniconsLine.bell,
        ),
        findsOneWidget,
      );
      expect(find.text("9+"), findsOneWidget);
    });

    testWidgets("should not render badge with zero notifications",
        (WidgetTester tester) async {
      // GIVEN
      const notifications = 0;
      final widget = NotificationBell(
        numberOfNotifications: notifications,
        onPressed: () {},
        iconProps: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.bell,
          ),
        ),
      );

      // WHEN
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      // THEN
      expect(find.byKey(Key(NotificationBell.badgeKey)), findsNothing);
      expect(find.byKey(Key(NotificationBell.bellKey)), findsOneWidget);
      expect(find.text(notifications.toString()), findsNothing);
    });

    testWidgets("should call onPressed", (WidgetTester tester) async {
      // GIVEN
      bool pressed = false;
      final widget = NotificationBell(
        numberOfNotifications: 0,
        onPressed: () {
          pressed = true;
        },
        iconProps: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.bell,
          ),
        ),
      );

      // WHEN
      await tester.pumpWidget(wrapWithMaterialApp(widget));
      await tester.tap(find.byType(NotificationBell));
      await tester.pumpAndSettle();

      // THEN
      expect(pressed, true);
    });
  });
}
