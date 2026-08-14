import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/custom_tabs.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:material_ui/material_ui.dart';

final customTabsDoc = ElementPreview(
  document: CustomTabsDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: SizedBox(
        height: 200,
        width: double.infinity,
        child: Row(
          children: [
            CustomTabs(
              listTabNames: const ["First Tab", "Second Tab"],
              onChangeTabIndex: (p0) {},
              listTabView: [
                Center(
                  child: PrimaryButton(text: "First Tab", onPressed: () {}),
                ),
                Center(
                  child: SecondaryButton(text: "Second Tab", onPressed: () {}),
                )
              ],
            ),
          ],
        ),
      ),
      description: "Custom tabs preview",
    ),
    WidgetPreview(
      widget: SizedBox(
        height: 200,
        width: double.infinity,
        child: Row(
          children: [
            CustomTabs(
              listTabNames: const ["First Tab", "Second Tab"],
              onChangeTabIndex: (p0) {},
              listTabView: [
                Center(
                  child: PrimaryButton(text: "First Tab", onPressed: () {}),
                ),
                Center(
                  child: SecondaryButton(text: "Second Tab", onPressed: () {}),
                )
              ],
              rightButton: TertiaryButton(onPressed: () {}, text: "filtrar"),
            ),
          ],
        ),
      ),
      description: "Custom tabs preview with right button",
    ),
  ],
);
