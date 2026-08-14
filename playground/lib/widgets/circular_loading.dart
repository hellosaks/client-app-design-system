import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/circular_loading/circular_loading.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:material_ui/material_ui.dart';

final circularLoadingDoc = ElementPreview(
  document: CircularLoadingDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const CircularLoading(),
      description: 'Example circular loading',
    ),
    WidgetPreview(
      widget: const SizedBox(
        height: 20,
        width: 20,
        child: CircularLoading(),
      ),
      description: 'Example circular loading',
    ),
  ],
);
