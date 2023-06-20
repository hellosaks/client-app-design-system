import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CustomDividerBuilder extends JsonWidgetBuilder {
  final Color? color;

  static const type = "custom_divider";

  const CustomDividerBuilder({
    this.color,
    required super.numSupportedChildren,
  });

  factory CustomDividerBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return CustomDividerBuilder(
      color: pick(json, "color").letOrNull(
        (p0) => colorDecoder(
          p0.asStringOrThrow(),
        ),
      ),
      numSupportedChildren: 1,
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return CustomDivider(
      color: color,
    );
  }
}
