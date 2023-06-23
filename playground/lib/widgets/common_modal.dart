import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/common_modal/common_modal.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final commonModalDoc = ElementPreview(
  document: CommonModalDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
        ),
      ),
      description: 'Example common modal',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
        ),
      ),
      description: 'Example common modal with onPress button',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
          onCloseButton:
              ButtonProperties(onPressed: () {}, title: "Close modal"),
        ),
      ),
      description: 'Example common modal with onClose button',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
          onCloseButton:
              ButtonProperties(onPressed: () {}, title: "Close modal"),
          tertiaryButton:
              ButtonProperties(onPressed: () {}, title: "Tertiary button"),
        ),
      ),
      description: 'Example common modal with tertiary button',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
          onCloseButton:
              ButtonProperties(onPressed: () {}, title: "Close modal"),
          tertiaryButton:
              ButtonProperties(onPressed: () {}, title: "Tertiary button"),
          loading: true,
        ),
      ),
      description: 'Example common modal with loading',
    ),
  ],
);
