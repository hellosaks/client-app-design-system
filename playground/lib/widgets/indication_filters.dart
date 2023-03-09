import 'package:client_app_design_system/components/indication_filters.dart';
import 'package:client_app_design_system/components/indication_filters.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/cupertino.dart';

final indicationFiltersDoc = ElementPreview(
  document: IndicationFiltersDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: SizedBox(
        child: Row(children: const [IndicationFilters(), IndicationFilters()]),
      ),
      description: 'Default H1 variant text',
    ),
  ],
);
