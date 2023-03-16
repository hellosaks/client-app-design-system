import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/button_special.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

final specialButtonDoc = ElementPreview(
  document: SpecialButtonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SpecialButton(
            label: 'WhatsApp',
            onPressed: () {},
            variant: SpecialButtonVariant.whatsapp,
          ),
          SpecialButton(
            label: 'Compartilhar',
            onPressed: () {},
            variant: SpecialButtonVariant.share,
          ),
        ],
      ),
      description: 'Special button side by side',
    ),
    WidgetPreview(
      widget: SpecialButton(
        label: 'WhatsApp',
        onPressed: () {},
        variant: SpecialButtonVariant.whatsapp,
      ),
      description: 'Special button variant whatsapp',
    ),
    WidgetPreview(
      widget: SpecialButton(
        label: 'Compartilhar',
        onPressed: () {},
        variant: SpecialButtonVariant.share,
      ),
      description: 'Special button variant share',
    ),
    WidgetPreview(
      widget: SpecialButton(
        label: 'WhatsApp',
        onPressed: () {},
        variant: SpecialButtonVariant.whatsapp,
        disabled: true,
      ),
      description: 'Special button variant whatsapp disabled',
    ),
    WidgetPreview(
      widget: SpecialButton(
        label: 'Compartilhar',
        onPressed: () {},
        variant: SpecialButtonVariant.share,
        disabled: true,
      ),
      description: 'Special button variant share disabled',
    ),
  ],
);
