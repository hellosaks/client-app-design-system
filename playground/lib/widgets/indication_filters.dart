import 'package:client_app_design_system/components/indication_filters.dart';
import 'package:client_app_design_system/components/indication_filters.doc_widget.dart';
import 'package:client_app_design_system/utils/enums.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/cupertino.dart';

final indicationFiltersDoc = ElementPreview(
  document: IndicationFiltersDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: SizedBox(
        child: Row(children: const [
          IndicationFilters(
            text: "Ativados",
            filter: Filter.activated,
            number: "1",
          ),
          IndicationFilters(
            text: "Pendentes",
            filter: Filter.pending,
            number: "2",
          )
        ]),
      ),
      description: 'Default H1 variant text',
    ),
  ],
);
