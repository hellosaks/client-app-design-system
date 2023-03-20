import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;

IconProps iconProps({
  required IconVariant variant,
  required dynamic props,
  Color? color,
}) {
  const double size = 24;

  switch (variant) {
    case IconVariant.heroicons:
      final HeroIconsProps heroIconProps = props as HeroIconsProps;

      heroIconProps.color = color;
      heroIconProps.size = size;
      return IconProps(variant: variant, heroIconsProps: heroIconProps);

    case IconVariant.unicons:
      final UniconsProps uniconsProps = props as UniconsProps;

      uniconsProps.color = color;
      uniconsProps.size = size;

      return IconProps(variant: variant, uniconsProps: uniconsProps);
    case IconVariant.custom:
      final CustomIconsProps customIconsProps = props as CustomIconsProps;

      customIconsProps.color = color;
      customIconsProps.size = size;

      return IconProps(
        variant: variant,
        customIconsProps: customIconsProps,
      );
  }
}
