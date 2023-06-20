import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CardBannerBuilder extends JsonWidgetBuilder {
  final String backgroundImage;

  final void Function()? onPressed;

  /// add title bellow image
  final String? title;

  /// show button to call action
  final String? buttonLabel;

  /// used when loading image
  final String? blurHash;

  /// used when loading image to show skeleton or blurhash
  final double? aspectRatio;

  static const type = "card_banner";

  const CardBannerBuilder({
    required this.backgroundImage,
    this.onPressed,
    this.buttonLabel,
    this.title,
    this.blurHash,
    this.aspectRatio,
    required super.numSupportedChildren,
  });

  factory CardBannerBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    final void Function()? onPressed = json["onPressed"] as void Function()?;

    return CardBannerBuilder(
      backgroundImage: pick(json, "backgroundImage").asStringOrThrow(),
      title: pick(json, "title").asStringOrNull(),
      buttonLabel: pick(json, "buttonLabel").asStringOrNull(),
      blurHash: pick(json, "blurHash").asStringOrNull(),
      aspectRatio: pick(json, "aspectRatio").asDoubleOrNull(),
      onPressed: onPressed,
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
    return CardBanner(
      backgroundImage: backgroundImage,
      aspectRatio: aspectRatio ?? 16 / 5,
      blurHash: blurHash,
      buttonLabel: buttonLabel,
      title: title,
      onPressed: onPressed,
    );
  }
}
