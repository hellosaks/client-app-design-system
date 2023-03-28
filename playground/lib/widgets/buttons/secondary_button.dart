import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/color_attributes.dart';
import 'package:client_app_design_system/components/buttons/secondary_button.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final photoIconProps = IconProps(
  variant: IconVariant.heroicons,
  heroIconsProps: HeroIconsProps(icon: HeroIcons.photo),
);

final withSeaColorProps = ColorAttributesButton(
  bgColor: ThemeSAKS.colors.primary.sea,
  pressColor: ThemeSAKS.colors.secondary.anchor,
);

final withDangerColorProps = ColorAttributesButton(
  bgColor: ThemeSAKS.colors.utility.aggressive,
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

final outlinedColor = ColorAttributesButton(
  insideColor: ThemeSAKS.colors.primary.sea,
  pressColor: ThemeSAKS.colors.secondary.anchor,
);
final outlinedColorSaks = ColorAttributesButton(
  insideColor: ThemeSAKS.colors.primary.saks,
  pressColor: ThemeSAKS.colors.secondary.anchor,
  borderColor: ThemeSAKS.colors.primary.saks,
);

const text = "Button";
final outlinedButton = [
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          colorAttributes: outlinedColor,
          leftIcon: photoIconProps,
          onPressed: () {},
          outlined: true,
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: outlinedColor,
          leftIcon: photoIconProps,
          disabled: true,
          onPressed: () {},
          text: text,
          outlined: true,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: outlinedColorSaks,
          leftIcon: photoIconProps,
          onPressed: () {},
          text: text,
          outlined: true,
        ),
        SecondaryButton(
          colorAttributes: outlinedColorSaks,
          leftIcon: photoIconProps,
          disabled: true,
          onPressed: () {},
          text: text,
          outlined: true,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          outlined: true,
          text: text,
          colorAttributes: outlinedColor,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          onPressed: () {},
          outlined: true,
          leftIcon: leftIconProps,
          text: text,
          colorAttributes: outlinedColor,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: outlinedColor,
          onPressed: () {},
          outlined: true,
          leftIcon: rightIconProps,
          disabled: true,
          text: text,
        ),
        SecondaryButton(
          onPressed: () {},
          outlined: true,
          text: text,
          colorAttributes: outlinedColor,
          selected: true,
        ),
      ],
    ),
    description: '',
  ),
];

final withSeaColor = [
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          leftIcon: leftIconProps,
          text: text,
          colorAttributes: withSeaColorProps,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: withSeaColorProps,
          onPressed: () {},
          leftIcon: leftIconProps,
          disabled: true,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          colorAttributes: withSeaColorProps,
          onPressed: () {},
          rightIcon: rightIconProps,
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: withSeaColorProps,
          onPressed: () {},
          disabled: true,
          rightIcon: rightIconProps,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          colorAttributes: withSeaColorProps,
          onPressed: () {},
          rightIcon: photoIconProps,
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: withSeaColorProps,
          onPressed: () {},
          disabled: true,
          rightIcon: photoIconProps,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          colorAttributes: withSeaColorProps,
          onPressed: () {},
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: withSeaColorProps,
          selected: true,
          disabled: true,
          onPressed: () {},
          text: text,
        ),
      ],
    ),
    description: '',
  ),
];

final withPrimaryColor = [
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          rightIcon: photoIconProps,
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          onPressed: () {},
          disabled: true,
          rightIcon: photoIconProps,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          leftIcon: leftIconProps,
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          onPressed: () {},
          leftIcon: leftIconProps,
          disabled: true,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          rightIcon: rightIconProps,
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          onPressed: () {},
          rightIcon: rightIconProps,
          disabled: true,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          selected: true,
          disabled: true,
          onPressed: () {},
          text: text,
        ),
      ],
    ),
    description: '',
  ),
];

final withDangerColor = [
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          rightIcon: photoIconProps,
          text: text,
          colorAttributes: withDangerColorProps,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          onPressed: () {},
          disabled: true,
          colorAttributes: withDangerColorProps,
          rightIcon: photoIconProps,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          leftIcon: leftIconProps,
          text: text,
          colorAttributes: withDangerColorProps,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: withDangerColorProps,
          onPressed: () {},
          leftIcon: leftIconProps,
          disabled: true,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          colorAttributes: withDangerColorProps,
          onPressed: () {},
          rightIcon: rightIconProps,
          text: text,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          onPressed: () {},
          colorAttributes: withDangerColorProps,
          rightIcon: rightIconProps,
          disabled: true,
          text: text,
        ),
      ],
    ),
    description: '',
  ),
  WidgetPreview(
    widget: Wrap(
      runSpacing: 10,
      children: [
        SecondaryButton(
          onPressed: () {},
          text: text,
          colorAttributes: withDangerColorProps,
        ),
        const SizedBox(
          width: 100,
        ),
        SecondaryButton(
          colorAttributes: withDangerColorProps,
          selected: true,
          disabled: true,
          onPressed: () {},
          text: text,
        ),
      ],
    ),
    description: '',
  ),
];

final secondaryButtonDoc = ElementPreview(
  document: SecondaryButtonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTypography(
            variant: TypographyVariant.h2,
            text: "Outlined Sea",
            color: ThemeSAKS.colors.primary.sea,
          ),
        ],
      ),
    ),
    ...outlinedButton,
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
