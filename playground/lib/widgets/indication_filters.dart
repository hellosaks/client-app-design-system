import 'package:client_app_design_system/components/indication_filters.dart';
import 'package:client_app_design_system/components/indication_filters.doc_widget.dart';
import 'package:client_app_design_system/utils/enums.dart';
import 'package:doc_widget/doc_widget.dart';

final indicationFiltersDoc = ElementPreview(
  document: IndicationFiltersDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: IndicationFilters(
        text: "Ativados",
        filter: Filter.activated,
        number: "1",
        onPressed: () {},
      ),
      description: 'IndicationFilters variant Filter.activated',
    ),
    WidgetPreview(
      widget: IndicationFilters(
        text: "Pendentes",
        filter: Filter.pending,
        number: "2",
        onPressed: () {},
      ),
      description: 'IndicationFilters variant Filter.pending ',
    ),
  ],
);
