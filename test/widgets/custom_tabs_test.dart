import "package:client_app_design_system/components/custom_tabs.dart";
import "package:client_app_design_system/theme/theme_saks.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mix/mix.dart";

import "../utils/test_wrappers.dart";

void main() {
  final List<String> titleTabs = [
    "Tab 1",
    "Tab 2",
  ];

  const List<Widget> listTabView = [
    Text("Screen Tab 1"),
    Text("Screen Tab 2"),
  ];

  testWidgets(
    "Should tabs component be visible.",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));

      expect(find.byType(CustomTabs), findsOneWidget);
    },
  );

  testWidgets(
    "Should list tabs be visible ",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));

      expect(find.byType(Tab), findsNWidgets(2));
    },
  );

  testWidgets(
    "Should list tabs bar title can be correct.",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));
      final tabs = find.byType(Tab);

      final Tab firsTab = tester.widget(tabs.first) as Tab;
      expect(firsTab.text, "Tab 1");

      final Tab secondTab = tester.widget(tabs.last) as Tab;
      expect(secondTab.text, "Tab 2");
    },
  );

  testWidgets(
    "Should propertys tabs bar title can be correct.",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));
      final TabBar tabBar = tester.widget(find.byType(TabBar));

      expect(tabBar.isScrollable, true);
      expect(tabBar.tabs.length, 2);
      expect(
        tabBar.unselectedLabelColor,
        OldThemeSAKS.colors.blackTone.colorBlack01,
      );
      expect(
        tabBar.indicatorSize,
        TabBarIndicatorSize.label,
      );

      expect(
        tabBar.indicatorWeight,
        0,
      );

      expect(
        tabBar.labelStyle,
        const TextStyle(fontWeight: FontWeight.w600),
      );
      expect(
        tabBar.indicator,
        BoxDecoration(
          color: OldThemeSAKS.colors.blueTone.colorBlue08,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      );
    },
  );

  testWidgets(
    "Should tabs index 0 default is visible ",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));

      final tabs = find.byType(Tab);

      final TabController controller =
          DefaultTabController.of(tester.element(tabs.first));

      expect(controller, isNotNull);

      expect(controller.index, 0);
    },
  );

  testWidgets(
    "Should text on screen inside tabview be correct",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));
      final TabBarView tabBarView = tester.widget(find.byType(TabBarView));

      final Text textScreen = tabBarView.children.first as Text;
      expect(textScreen.data, "Screen Tab 1");
    },
  );

  testWidgets(
    "Should change tab be successful",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
        currentTabIndex: 1,
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));

      final tabs = find.byType(Tab);

      final TabController controller =
          DefaultTabController.of(tester.element(tabs.first));

      await tester.tap(tabs.last);
      await tester.pump();

      expect(controller.index, 1);
    },
  );

  testWidgets(
    "Should scrollable TabBar tap selects tab",
    (WidgetTester tester) async {
      int indexTab = 1;
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {
          indexTab = index;
        },
        currentTabIndex: indexTab,
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));

      final tabs = find.byType(Tab);

      final TabController controller =
          DefaultTabController.of(tester.element(tabs.first));

      await tester.tap(tabs.last);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(controller.index, 1);

      await tester.tap(tabs.first);
      await tester.pumpAndSettle();

      expect(controller.index, 0);
    },
  );

  testWidgets(
    "Should render correctly button right",
    (WidgetTester tester) async {
      final widget = CustomTabs(
        listTabNames: titleTabs,
        listTabView: listTabView,
        onChangeTabIndex: (index) {},
        rightButton: const SizedBox(
          key: Key("sizebox"),
        ),
      );

      await tester.pumpWidget(wrapWithMaterialApp(VBox(children: [widget])));

      expect(find.byKey(const Key("sizebox")), findsOneWidget);
    },
  );
}
