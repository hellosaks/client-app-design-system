import 'package:client_app_design_system/components/referral_card.dart';
import 'package:client_app_design_system/components/referral_card.doc_widget.dart';
import 'package:client_app_design_system/utils/enums.dart';
import 'package:doc_widget/doc_widget.dart';

final referralCardDoc = ElementPreview(
  document: ReferralCardDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const ReferralCard(payment: Payment.pending, textBonus: "Bonus"),
      description: 'Referral card',
    ),
  ],
);
