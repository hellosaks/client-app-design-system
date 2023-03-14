import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/special.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final specialButtonDoc = ElementPreview(
  document: SpecialButtonDocWidget(), // From generated file
  previews: [
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
