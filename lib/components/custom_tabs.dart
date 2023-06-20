import "package:client_app_design_system/components/custom_divider/custom_divider.dart";
import "package:client_app_design_system/theme/theme_saks.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";
import "package:mix/mix.dart";

@docWidget
class CustomTabs extends StatefulWidget {
  /// List of tab names
  final List<String> listTabNames;

  /// List of widgets with tabs
  final List<Widget> listTabView;

  /// Widget to show at right, after tabs
  final Widget? rightButton;

  /// Current tab selected
  final int currentTabIndex;

  /// Callback to be called when tab is changed
  final Function(int) onChangeTabIndex;

  const CustomTabs({
    required this.listTabNames,
    required this.listTabView,
    required this.onChangeTabIndex,
    this.currentTabIndex = 0,
    this.rightButton,
  });

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  bool isRegisteredChangeTabIndexListener = false;
  @override
  Widget build(BuildContext context) {
    final totalTabs = widget.listTabNames.length;
    return Container(child: _buildBody(totalTabs: totalTabs, context: context));
  }

  Widget _buildBody({required int totalTabs, required BuildContext context}) {
    final styles = Mix(flex(1), bgColor(Colors.transparent));

    final stylesTabBar = Mix(
      py(20),
      px(10),
    );
    return DefaultTabController(
      length: totalTabs,
      initialIndex: widget.currentTabIndex,
      child: Builder(
        builder: (BuildContext context) {
          onChangeTab(context);
          return VBox(
            mix: styles,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Box(
                      mix: stylesTabBar,
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor:
                              OldThemeSAKS.typography.textScaleFactor,
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: OldThemeSAKS.colors.blueTone.colorBlue08,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          unselectedLabelColor:
                              OldThemeSAKS.colors.blackTone.colorBlack01,
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.w600),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 0,
                          isScrollable: true,
                          tabs: _buildTabs(),
                        ),
                      ),
                    ),
                  ),
                  if (widget.rightButton != null) ...[
                    widget.rightButton!,
                    const SizedBox(
                      width: 20,
                    )
                  ]
                ],
              ),
              const CustomDivider(),
              Expanded(
                child: Box(
                  child: TabBarView(
                    children: widget.listTabView,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildTabs() {
    final styles = Mix(
      height(30),
      px(15),
      py(5),
      borderWidth(0.5),
      rounded(20),
      borderColor(OldThemeSAKS.colors.grayTone.colorGray03),
    );
    return widget.listTabNames
        .map((name) => Box(mix: styles, child: Tab(text: name)))
        .toList();
  }

  void onChangeTab(BuildContext context) {
    // change tab index
    final TabController tabController = DefaultTabController.of(context);
    tabController.index = widget.currentTabIndex;

    // add listener to notify other components or controllers
    if (!isRegisteredChangeTabIndexListener) {
      tabController.addListener(() {
        widget.onChangeTabIndex(tabController.index);
      });
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          isRegisteredChangeTabIndexListener = true;
        });
      });
    }
  }
}
