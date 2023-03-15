import 'package:client_app_design_system/components/referral_card.dart';
import 'package:client_app_design_system/components/referral_card.doc_widget.dart';
import 'package:client_app_design_system/utils/data_label.dart';
import 'package:client_app_design_system/utils/enums.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:intl/intl.dart';

final referralCardDoc = ElementPreview(
  document: ReferralCardDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: ReferralCard(
        payment: Payment.paid,
        textBonus: "Bonus",
        name: "jose",
        valueBonus: "20 real",
        dataLabel: DataLabel(label: [
          "jorge",
          "felipe"
        ], data: [
          DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
        ]),
        dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
      ),
      description: 'Referral card',
    ),
  ],
);
