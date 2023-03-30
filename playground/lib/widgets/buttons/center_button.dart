import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/center_button.dart';
import 'package:client_app_design_system/components/buttons/center_button.doc_widget.dart';
import 'package:client_app_design_system/components/buttons/color_attributes.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final withSeaColorPropsNotBG = ColorAttributesButton(
  insideColor: ThemeSAKS.colors.primary.sea,
  pressColor: ThemeSAKS.colors.secondary.anchor,
);

final withSeaColorProps = ColorAttributesButton(
  bgColor: ThemeSAKS.colors.primary.sea,
  pressColor: ThemeSAKS.colors.secondary.anchor,
);

final withPrimaryColorPropsNotBG = ColorAttributesButton(
  insideColor: ThemeSAKS.colors.primary.saks,
  pressColor: ThemeSAKS.colors.secondary.bay,
);

final withPrimaryColorProps = ColorAttributesButton(
  bgColor: ThemeSAKS.colors.primary.saks,
  pressColor: ThemeSAKS.colors.secondary.bay,
);

final centerButtonDoc = ElementPreview(
  document: CenterButtonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: Wrap(
        children: [
          CenterButton(
            onPressed: () {},
            colorAttributes: withSeaColorPropsNotBG,
            icon: UniconsLine.arrow_left,
          ),
          CenterButton(
            disabled: true,
            onPressed: () {},
            colorAttributes: withSeaColorPropsNotBG,
            icon: UniconsLine.arrow_right,
          ),
        ],
      ),
    ),
    WidgetPreview(
      widget: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          CenterButton(
            onPressed: () {},
            colorAttributes: withSeaColorProps,
            icon: UniconsLine.arrow_left,
          ),
          CenterButton(
            onPressed: () {},
            disabled: true,
            colorAttributes: withSeaColorProps,
            icon: UniconsLine.arrow_right,
          ),
        ],
      ),
    ),
    WidgetPreview(
      widget: Wrap(
        children: [
          CenterButton(
            onPressed: () {},
            colorAttributes: withPrimaryColorPropsNotBG,
            icon: UniconsLine.arrow_left,
          ),
          CenterButton(
            disabled: true,
            onPressed: () {},
            colorAttributes: withPrimaryColorPropsNotBG,
            icon: UniconsLine.arrow_right,
          ),
        ],
      ),
    ),
    WidgetPreview(
      widget: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          CenterButton(
            onPressed: () {},
            colorAttributes: withPrimaryColorProps,
            icon: UniconsLine.arrow_left,
          ),
          CenterButton(
            onPressed: () {},
            disabled: true,
            colorAttributes: withPrimaryColorProps,
            icon: UniconsLine.arrow_right,
          ),
        ],
      ),
    ),
  ],
);
