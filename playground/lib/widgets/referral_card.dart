import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/referral_card.doc_widget.dart';
import 'package:client_app_design_system/utils/data_label.dart';
import 'package:doc_widget/doc_widget.dart';

final referralCardDoc = ElementPreview(
  document: ReferralCardDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: ReferralCard(
        payment: ReferralPaymentType.pending,
        icon: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.star,
          ),
        ),
        textBonus: "Bônus Campanha",
        name: "10 amigos Icatú",
        valueBonus: "R\$ 25,00",
        textPaid: "Pendente",
        dataLabel: [
          DataLabel(
            data: "15/02/2023",
            label: "Campanha iniciada",
          ),
          DataLabel(
            data: "15/02/2023",
            label: "Objetivo alcançado",
          ),
        ],
        onPressed: () {},
        dateCard: "02/02/2022",
      ),
      description: 'Referral card Paid color',
    ),
    WidgetPreview(
      widget: ReferralCard(
        payment: ReferralPaymentType.paid,
        icon: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.user,
          ),
        ),
        textBonus: "Bonus",
        name: "Victor  Paulo",
        valueBonus: "R\$20,00",
        textPaid: "Pago",
        dataLabel: [
          DataLabel(
            data: "15/02/2023",
            label: "Indicado cadastrado",
          ),
          DataLabel(
            data: "15/02/2023",
            label: "Plano contratado",
          ),
          DataLabel(label: "Pagamento do plano efetuado"),
        ],
        dateCard: "12/01/2023",
        onPressed: () {},
      ),
      description: 'Referral card Pending color',
    ),
  ],
);
