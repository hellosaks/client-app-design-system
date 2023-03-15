import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/referral_card.dart';
import 'package:client_app_design_system/components/referral_card.doc_widget.dart';
import 'package:client_app_design_system/utils/data_label.dart';
import 'package:doc_widget/doc_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

final referralCardDoc = ElementPreview(
  document: ReferralCardDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: ReferralCard(
        payment: Payment.paid,
        icon: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.star,
          ),
        ),
        textBonus: "Bonus",
        name: "Victor  Paulo",
        valueBonus: "20 reais",
        textPaid: "Pago",
        dataLabel: DataLabel(label: [
          "Indicado cadastrado",
          "Plano contratado",
          "Pagamento do plano efetuado"
        ], data: [
          DateFormat("dd/MM/yyyy").format(
            DateTime(2023, 02, 15),
          ),
          DateFormat("dd/MM/yyyy").format(
            DateTime(2022, 02, 16),
          ),
          DateFormat("dd/MM/yyyy").format(
            DateTime(2022, 02, 17),
          ),
        ]),
        onPressed: () {},
        dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
      ),
      description: 'Referral card',
    ),
  ],
);
