import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;

String shortLink(String linkToShort) {
  final link = linkToShort.replaceAll("https://", "");

  if (link.length < 20) return link;

  final firstShorLink = link.substring(0, 10);
  final secondShorLink = link.substring(link.length - 10, link.length);

  return "$firstShorLink...$secondShorLink";
}

IconProps iconProps({
  required IconVariant variant,
  required IconProps props,
  Color? color,
  double? size,
}) {
  switch (variant) {
    case IconVariant.heroicons:
      final HeroIconsProps heroIconProps = props.heroIconsProps!;

      heroIconProps.color = color ?? props.heroIconsProps?.color;
      heroIconProps.size = size ?? props.heroIconsProps?.size;
      return IconProps(variant: variant, heroIconsProps: heroIconProps);

    case IconVariant.unicons:
      final UniconsProps uniconsProps = props.uniconsProps!;

      uniconsProps.color = color ?? props.uniconsProps?.color;
      uniconsProps.size = size ?? props.uniconsProps?.size;

      return IconProps(variant: variant, uniconsProps: uniconsProps);
    case IconVariant.custom:
      final CustomIconsProps customIconsProps = props.customIconsProps!;

      customIconsProps.color = color ?? props.customIconsProps?.color;
      customIconsProps.size = size ?? props.customIconsProps?.size;

      return IconProps(
        variant: variant,
        customIconsProps: customIconsProps,
      );
  }
}
