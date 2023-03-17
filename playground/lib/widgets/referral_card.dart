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
        payment: Payment.pending,
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
            data: DateFormat("dd/MM/yyyy").format(
              DateTime(2023, 02, 15),
            ),
            label: "Campanha iniciada",
          ),
          DataLabel(
            data: DateFormat("dd/MM/yyyy").format(
              DateTime(2023, 02, 15),
            ),
            label: "Objetivo alcançado",
          ),
        ],
        onPressed: () {},
        dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2022, 02, 02)),
      ),
      description: 'Referral card Paid color',
    ),
    WidgetPreview(
      widget: ReferralCard(
        payment: Payment.paid,
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
            data: DateFormat("dd/MM/yyyy").format(
              DateTime(2023, 02, 15),
            ),
            label: "Indicado cadastrado",
          ),
          DataLabel(
            data: DateFormat("dd/MM/yyyy").format(
              DateTime(2023, 02, 15),
            ),
            label: "Plano contratado",
          ),
          DataLabel(label: "Pagamento do plano efetuado"),
        ],
        dateCard: DateFormat("dd/MM/yyyy").format(DateTime(2023, 01, 12)),
        onPressed: () {},
      ),
      description: 'Referral card Pending color',
    ),
  ],
);
