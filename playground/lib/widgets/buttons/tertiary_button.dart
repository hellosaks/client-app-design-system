import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/color_attributes.dart';
import 'package:client_app_design_system/components/buttons/tertiary_button.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final withSeaColorProps = ColorAttributesButton(
  insideColor: ThemeSAKS.colors.primary.sea,
  pressColor: ThemeSAKS.colors.secondary.anchor,
);

final withDangerColorProps = ColorAttributesButton(
  insideColor: ThemeSAKS.colors.utility.aggressive,
  pressColor: ThemeSAKS.colors.special.rose,
);

final leftIconProps = IconProps(
  variant: IconVariant.heroicons,
  heroIconsProps: HeroIconsProps(
    icon: HeroIcons.arrowLeft,
  ),
);

final rightIconProps = IconProps(
  variant: IconVariant.heroicons,
  heroIconsProps: HeroIconsProps(
    icon: HeroIcons.arrowRight,
  ),
);

final withSeaColor = [
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withSeaColorProps,
      leftIcon: leftIconProps,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example left icon',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withSeaColorProps,
      rightIcon: rightIconProps,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example right icon',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withSeaColorProps,
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text underline',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withSeaColorProps,
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text strikethrough',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withSeaColorProps,
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: 'Example when is it is disabled',
  ),
];
final withDangerColor = [
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withDangerColorProps,
      leftIcon: leftIconProps,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with left icon',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withDangerColorProps,
      rightIcon: rightIconProps,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with right icon',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withDangerColorProps,
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text underline',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withDangerColorProps,
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text strikethrough',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      colorAttributes: withDangerColorProps,
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: 'Example when it is disabled',
  ),
];
final withPrimaryColor = [
  WidgetPreview(
    widget: TertiaryButton(
      leftIcon: leftIconProps,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with left icon',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      rightIcon: rightIconProps,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with right icon',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example text underline',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example text strikethrough',
  ),
  WidgetPreview(
    widget: TertiaryButton(
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: 'Example when it is disabled',
  ),
];

final tertiaryButtonDoc = ElementPreview(
  document: TertiaryButtonDocWidget(),
  previews: [
    WidgetPreview(
      widget: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTypography(
            variant: TypographyVariant.h2,
            text: "Primary color",
            color: ThemeSAKS.colors.primary.saks,
          )
        ],
      ),
    ),
    ...withPrimaryColor,
    WidgetPreview(
      widget: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTypography(
            variant: TypographyVariant.h2,
            text: "Sea color",
            color: ThemeSAKS.colors.primary.sea,
          ),
        ],
      ),
    ),
    ...withSeaColor,
    WidgetPreview(
      widget: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTypography(
            variant: TypographyVariant.h2,
            text: "Danger color",
            color: ThemeSAKS.colors.utility.aggressive,
          ),
        ],
      ),
    ),
    ...withDangerColor
  ],
);
