import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/color_attributes.dart';
import 'package:client_app_design_system/components/buttons/primary_button.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final withSeaColorProps = ColorAttributesButton(
  bgColor: ThemeSAKS.colors.primary.sea,
  pressColor: ThemeSAKS.colors.secondary.anchor,
);

final leftIconProps = IconProps(
  variant: IconVariant.unicons,
  uniconsProps: UniconsProps(
    icon: UniconsLine.arrow_circle_left,
  ),
);

final rightIconProps = IconProps(
  variant: IconVariant.unicons,
  uniconsProps: UniconsProps(
    icon: UniconsLine.arrow_circle_right,
  ),
);

const text = "Button";

final primaryButtonDoc = ElementPreview(
  document: PrimaryButtonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: Wrap(
        runSpacing: 10,
        children: [
          PrimaryButton(
            onPressed: () {},
            text: text,
          ),
          PrimaryButton(
            onPressed: () {},
            leftIcon: leftIconProps,
            text: text,
          ),
          PrimaryButton(
            onPressed: () {},
            rightIcon: rightIconProps,
            text: text,
          ),
          PrimaryButton(
            onPressed: () {},
            leftIcon: leftIconProps,
            disabled: true,
            text: text,
          ),
          PrimaryButton(
            onPressed: () {},
            leftIcon: IconProps(
              variant: IconVariant.unicons,
              uniconsProps: UniconsProps(icon: UniconsLine.image),
            ),
            disabled: true,
            text: text,
          ),
        ],
      ),
      description: '',
    ),
  ],
);
