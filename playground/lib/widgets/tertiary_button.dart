import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/button_tertiary.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final withSeaColor = [
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.primary.sea,
        pressColor: ThemeSAKS.colors.secondary.stone,
      ),
      leftIcon: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: HeroIcons.arrowLeft,
        ),
      ),
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example left icon',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.primary.sea,
        pressColor: ThemeSAKS.colors.secondary.stone,
      ),
      rightIcon: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: HeroIcons.arrowRight,
        ),
      ),
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example right icon',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.primary.sea,
        pressColor: ThemeSAKS.colors.secondary.stone,
      ),
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text underline',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.primary.sea,
        pressColor: ThemeSAKS.colors.secondary.stone,
      ),
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text strikethrough',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.primary.sea,
        pressColor: ThemeSAKS.colors.secondary.stone,
      ),
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: 'Example when is it is disabled',
  ),
];
final withDangerColor = [
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.utility.aggressive,
        pressColor: ThemeSAKS.colors.special.rose,
      ),
      leftIcon: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: HeroIcons.arrowLeft,
        ),
      ),
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with left icon',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.utility.aggressive,
        pressColor: ThemeSAKS.colors.special.rose,
      ),
      rightIcon: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: HeroIcons.arrowRight,
        ),
      ),
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with right icon',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.utility.aggressive,
        pressColor: ThemeSAKS.colors.special.rose,
      ),
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text underline',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.utility.aggressive,
        pressColor: ThemeSAKS.colors.special.rose,
      ),
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with text strikethrough',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.utility.aggressive,
        pressColor: ThemeSAKS.colors.special.rose,
      ),
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: 'Example when it is disabled',
  ),
];
final withPrimaryColor = [
  WidgetPreview(
    widget: ButtonTertiary(
      leftIcon: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: HeroIcons.arrowLeft,
        ),
      ),
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with left icon',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      rightIcon: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: HeroIcons.arrowRight,
        ),
      ),
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example with right icon',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example text underline',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: 'Example text strikethrough',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: 'Example when it is disabled',
  ),
];

final tertiaryButtonDoc = ElementPreview(
  document: ButtonTertiaryDocWidget(),
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
