import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/aux_button.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final auxButtonDoc = ElementPreview(
  document: AuxButtonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: AuxButton(
        label: "Ver mais",
        onPressed: () {},
      ),
      description: 'Example of aux button with label and onPressed handler.',
    ),
    WidgetPreview(
      widget: AuxButton(
        label: "Ver mais",
        onPressed: () {},
        disabled: true,
      ),
      description:
          'Example of aux button with label and disabled onPressed handler.',
    ),
  ],
);
