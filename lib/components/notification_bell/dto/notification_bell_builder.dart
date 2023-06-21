import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class NotificationBellBuilder extends JsonWidgetBuilder {
  final int numberNotifications;
  final void Function()? onPressed;
  final IconProps iconProps;

  const NotificationBellBuilder({
    required this.iconProps,
    required this.numberNotifications,
    required super.numSupportedChildren,
    this.onPressed,
  });

  static const type = "notification_bell";

  factory NotificationBellBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    final void Function()? onPressed = json["onPressed"] as void Function()?;

    return NotificationBellBuilder(
      iconProps: pick(json, "icon_props")
          .letOrThrow((p0) => IconPropsDto().fromJson(p0.asMapOrThrow())),
      numberNotifications: pick(json, "number_notifications").asIntOrThrow(),
      onPressed: onPressed,
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
    return NotificationBell(
      numberOfNotifications: numberNotifications,
      onPressed: onPressed ?? () {},
      iconProps: iconProps,
    );
  }
}
