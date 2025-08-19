import 'package:client_app_design_system/components/information_card/information_card.dart';
import 'package:client_app_design_system/components/information_card/information_card.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final informationCardDoc = ElementPreview(
  document: InformationCardDocWidget(),
  previews: [
    WidgetPreview(
      widget: const InformationCard(
        rows: [
          InformationCardRow(info: "ISIN", value: "12345"),
          InformationCardRow(
              info: "Periodicidade do cupom", value: "Semestral"),
          InformationCardRow(info: "Data de Emissão", value: "22/05/2022"),
          InformationCardRow(info: "Data de Vencimento", value: "22/05/2025")
        ],
      ),
    )
  ],
);
