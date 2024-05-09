import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/transaction_type_enum.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

@docWidget
class SimpleTransaction extends StatelessWidget {
  final String transactionName;
  final String value;
  final TransactionType type;

  const SimpleTransaction({
    super.key,
    required this.transactionName,
    required this.value,
    required this.type,
  });

  static const double _iconSize = 24;

  Icon get icon {
    late IconData icon;
    switch (type) {
      case TransactionType.entrance:
        icon = UniconsLine.arrow_up;
        break;
      case TransactionType.withdrawal:
        icon = UniconsLine.arrow_down;
        break;
    }

    return Icon(
      props: IconProps(
        uniconsProps: UniconsProps(
          icon: icon,
          size: _iconSize,
          color: color,
        ),
        variant: IconVariant.unicons,
      ),
    );
  }

  Color get color {
    switch (type) {
      case TransactionType.entrance:
        return ThemeSAKS.colors.utility.conservative;
      case TransactionType.withdrawal:
        return ThemeSAKS.colors.utility.aggressive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: color.withOpacity(0.15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: icon,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTypography(
                variant: TypographyVariant.h5,
                text: transactionName,
              ),
              CustomTypography(
                variant: TypographyVariant.h6,
                text: value,
                weight: FontWeight.w600,
                color: color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
