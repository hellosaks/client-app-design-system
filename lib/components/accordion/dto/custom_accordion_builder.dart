import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:json_theme/json_theme.dart";

class CustomAccordionBuilder extends JsonWidgetBuilder {
  final Widget title;

  final Color backgroundColor;
  final Color collapsedBackgroundColor;

  final bool initiallyExpanded;

  final Color? iconColor;
  final double? borderRadius;

  const CustomAccordionBuilder({
    required this.title,
    required this.backgroundColor,
    required this.collapsedBackgroundColor,
    this.iconColor,
    this.borderRadius,
    this.initiallyExpanded = false,
    required super.numSupportedChildren,
  });

  static const type = "custom_accordion";

  factory CustomAccordionBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return CustomAccordionBuilder(
      numSupportedChildren: 1,
      backgroundColor: pick(json, "bg_color").letOrThrow(
        (pick) => ThemeDecoder.decodeColor(pick.asStringOrThrow())!,
      ),
      collapsedBackgroundColor: pick(json, "collapsed_bg_color").letOrThrow(
        (pick) => ThemeDecoder.decodeColor(pick.asStringOrThrow())!,
      ),
      iconColor: pick(json, "icon_color").letOrNull(
        (pick) => ThemeDecoder.decodeColor(pick.asStringOrThrow())!,
      ),
      borderRadius: pick(json, "border_radius").asDoubleOrNull(),
      initiallyExpanded: pick(json, "initially_expanded").asBoolOrFalse(),
      title: Container(),
    );
  }

  Map<dynamic, dynamic> getTitle({
    required Map<dynamic, dynamic> json,
  }) {
    final title = pick(json, "title").asMapOrThrow();
    return title;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final title = getTitle(json: data.args as Map<String, dynamic>);

    return CustomAccordion(
      borderRadius: borderRadius,
      iconColor: iconColor,
      backgroundColor: backgroundColor,
      collapsedBackgroundColor: collapsedBackgroundColor,
      title: JsonWidgetData.fromDynamic(title)?.build(context: context) ??
          Container(),
      children: [
        // builds a list of widgets from a json list present
        // in the component's children property
        for (var child in data.children ?? <JsonWidgetData>[])
          child.build(
            context: context,
            childBuilder: childBuilder,
          ),
      ],
    );
  }
}
