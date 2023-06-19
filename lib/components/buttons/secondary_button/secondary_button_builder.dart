import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:client_app_design_system/components/buttons/secondary_button/secondary_button.dart";
import "package:client_app_design_system/components/icon/dto/icon_dto.dart";
import "package:client_app_design_system/components/icon/icon.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class SecondaryButtonBuilder extends JsonWidgetBuilder {
  final String text;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool? disabled;
  final bool? selected;
  final bool? outlined;
  final void Function() onPressed;

  final ColorAttributesButton? colorAttributes;

  static const type = "secondary_button";

  const SecondaryButtonBuilder({
    required this.text,
    required this.onPressed,
    this.colorAttributes,
    this.leftIcon,
    this.rightIcon,
    this.disabled,
    this.selected,
    this.outlined,
    required super.numSupportedChildren,
  });

  static IconProps _buildIcon(Map<String, dynamic> json) {
    return IconPropsDto().fromJson(json);
  }

  factory SecondaryButtonBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    final void Function()? onPressed = json["onPressed"] as void Function()?;
    return SecondaryButtonBuilder(
      numSupportedChildren: 1,
      onPressed: onPressed ?? () {},
      text: pick(json, "text").asStringOrThrow(),
      disabled: pick(json, "disabled").asBoolOrFalse(),
      selected: pick(json, "selected").asBoolOrFalse(),
      outlined: pick(json, "outlined").asBoolOrFalse(),
      rightIcon: pick(json, "right_icon").letOrNull(
        (p0) => _buildIcon(
          p0.asMapOrThrow(),
        ),
      ),
      colorAttributes: pick(json, "color_attribrutes").letOrNull(
        (p0) => ColorAttributesButton.fromJson(
          p0.asMapOrThrow(),
        ),
      ),
      leftIcon: pick(json, "left_icon").letOrNull(
        (p0) => _buildIcon(
          p0.asMapOrThrow(),
        ),
      ),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return SecondaryButton(
      colorAttributes: colorAttributes,
      leftIcon: leftIcon,
      onPressed: onPressed,
      outlined: outlined!,
      selected: selected!,
      disabled: disabled!,
      text: text,
      rightIcon: rightIcon,
    );
  }
}
