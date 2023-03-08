import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/referral_button.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final referralButtonDoc = ElementPreview(
  document: ReferralButtonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: ReferralButton(
        onCopy: (link) {},
        title: "Link de Indicação",
        linkToCopy: "aalinked.hellosaks.com/referrals/XmCo",
        feedbackOnCopy: "Link copiado!",
      ),
      description: 'Referral button',
    ),
  ],
);
