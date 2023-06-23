import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/common_modal/dto/button_properties_dto.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CommonModalBuilder extends JsonWidgetBuilder {
  final ButtonProperties? onPressButton;
  final ButtonProperties? onCloseButton;
  final ButtonProperties? tertiaryButton;

  final IconProps currentIconProps;
  final String title;
  final String description;
  final double? modalHeight;
  final bool? loading;

  static const type = "common_modal";

  const CommonModalBuilder({
    required this.currentIconProps,
    required this.title,
    required this.description,
    this.modalHeight,
    this.onPressButton,
    this.onCloseButton,
    this.tertiaryButton,
    this.loading,
    required super.numSupportedChildren,
  });

  factory CommonModalBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return CommonModalBuilder(
      title: pick(json, "title").asStringOrThrow(),
      description: pick(json, "description").asStringOrThrow(),
      currentIconProps: pick(json, "currentIconProps")
          .letOrThrow((pick) => IconPropsDto().fromJson(pick.asMapOrThrow())),
      loading: pick(json, "loading").asBoolOrNull(),
      modalHeight: pick(json, "modalHeight").asDoubleOrNull(),
      onCloseButton: pick(json, "onCloseButton").letOrNull(
        (pick) => ButtonPropertiesDto().fromJson(pick.asMapOrThrow()),
      ),
      onPressButton: pick(json, "onPressButton").letOrNull(
        (pick) => ButtonPropertiesDto().fromJson(pick.asMapOrThrow()),
      ),
      tertiaryButton: pick(json, "tertiaryButton").letOrNull(
        (pick) => ButtonPropertiesDto().fromJson(pick.asMapOrThrow()),
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
    return CommonModal(
      currentIconProps: currentIconProps,
      description: description,
      title: title,
      loading: loading,
      modalHeight: modalHeight ?? 450,
      onCloseButton: onCloseButton,
      onPressButton: onPressButton,
      tertiaryButton: tertiaryButton,
    );
  }
}
