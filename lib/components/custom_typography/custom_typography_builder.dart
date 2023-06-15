import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/font_weight_dto.dart";
import "package:client_app_design_system/utils/enums/text_align_dto.dart";
import "package:client_app_design_system/utils/enums/typography_variant_dto.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";

class CustomTypographyBuilder extends JsonWidgetBuilder {
  final FontWeight? weight;
  final TypographyVariant variant;
  final String text;
  final Color? color;
  final TextAlign? align;
  final Mix<Attribute>? mix;

  static const type = "custom_typography";

  const CustomTypographyBuilder({
    this.weight,
    this.color,
    this.align,
    this.mix,
    required this.variant,
    required this.text,
    required super.numSupportedChildren,
  });

  factory CustomTypographyBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return CustomTypographyBuilder(
      numSupportedChildren: 1,
      text: pick(json, "text").asStringOrThrow(),
      variant: pick(json, "variant").letOrThrow(
        (p0) => TypographyVariantEnum().parse(
          p0.asStringOrThrow(),
        ),
      ),
      weight: pick(json, "weight").letOrNull(
        (p0) => FontWeightEnum().parse(
          p0.asStringOrThrow(),
        ),
      ),
      align: pick(json, "align").letOrNull(
        (p0) => TextAlignEnum().parse(
          p0.asStringOrThrow(),
        ),
      ),
      color: pick(json, "color")
          .letOrNull((pick) => colorDecoder(pick.asString())),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return CustomTypography(
      variant: variant,
      text: text,
      weight: weight,
      align: align,
      mix: mix,
      color: color,
    );
  }
}
