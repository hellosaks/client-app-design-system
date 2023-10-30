import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/accordion/custom_according.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final customAccordion = ElementPreview(
  document: CustomAccordionDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: CustomAccordion(
        title: Container(),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: ThemeSAKS.colors.primary.saks,
        children: const [],
      ),
      description: 'custom accordion',
    ),
  ],
);
