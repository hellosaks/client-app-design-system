import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/utils/util_functions.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class SvgBuilder extends JsonWidgetBuilder {
  final String? asset;
  final String? url;
  final Color? color;
  final double? height;

  final double? width;

  const SvgBuilder({
    this.asset,
    this.url,
    this.color,
    this.height,
    this.width,
    required super.numSupportedChildren,
  })  : assert(
          asset == null || url == null,
          "none of the properties for being null",
        ),
        assert(
          asset != null || url != null,
          "only one of the properties to be used",
        );

  static const type = "svg_picture";

  factory SvgBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return SvgBuilder(
      numSupportedChildren: 1,
      asset: pick(json, "asset").asStringOrNull(),
      url: pick(json, "url").asStringOrNull(),
      color: pick(json, "color")
          .letOrNull((pick) => colorDecoder(pick.asString())),
      height: pick(json, "height").asDoubleOrNull(),
      width: pick(json, "width").asDoubleOrNull(),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      "[SvgBuilder] does not support children.",
    );

    if (url != null) {
      return SvgPicture.network(
        url!,
        color: color,
        height: height,
        width: width,
      );
    }

    return SvgPicture.string(
      asset!,
      color: color,
      height: height,
      width: width,
    );
  }
}
