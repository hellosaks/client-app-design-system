import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class SkeletonBuilder extends JsonWidgetBuilder {
  const SkeletonBuilder({
    required super.numSupportedChildren,
    required this.height,
    this.width = double.infinity,
    this.radius,
  });

  final double height;
  final double? width;
  final double? radius;
  static const type = "skeleton";

  factory SkeletonBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return SkeletonBuilder(
      height: pick(json, "height").asDoubleOrThrow(),
      width: pick(json, "width").asDoubleOrNull(),
      radius: pick(json, "radius").asDoubleOrNull(),
      numSupportedChildren: 0,
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return Skeleton(
      height: height,
      width: width ?? double.infinity,
      radius: radius,
    );
  }
}
