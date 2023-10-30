import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class AvatarBuilder extends JsonWidgetBuilder {
  final void Function() onPressed;
  final double? radius;
  final String? imageUrl;

  const AvatarBuilder({
    required this.onPressed,
    this.radius,
    this.imageUrl,
    required super.numSupportedChildren,
  });

  static const type = "avatar";

  factory AvatarBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    final void Function()? onPressed = json["onPressed"] as void Function()?;
    return AvatarBuilder(
      numSupportedChildren: 1,
      onPressed: onPressed ?? () {},
      radius: pick(json, "radius").asDoubleOrNull() ?? 25,
      imageUrl: pick(json, "image_url").asStringOrNull(),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return Avatar(
      onPressed: onPressed,
      imageUrl: imageUrl,
      radius: radius,
    );
  }
}
