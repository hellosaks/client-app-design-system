import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/icon/dto/icon_dto.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart" hide Icon;
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class IconBuilder extends JsonWidgetBuilder {
  final IconProps props;

  static const type = "icon";

  const IconBuilder({
    required this.props,
    required super.numSupportedChildren,
  });

  factory IconBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return IconBuilder(
      props: pick(json, "props")
          .letOrThrow((pick) => IconPropsDto().fromJson(pick.asMapOrThrow())),
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
    return Icon(props: props);
  }
}
