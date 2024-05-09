import 'package:client_app_design_system/components/simple_transaction/simple_transaction.dart';
import 'package:client_app_design_system/components/simple_transaction/simple_transaction.doc_widget.dart';
import 'package:client_app_design_system/utils/enums/transaction_type_enum.dart';
import 'package:doc_widget/doc_widget.dart';

final simpleTransactionDoc = ElementPreview(
  document: SimpleTransactionDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const SimpleTransaction(
        type: TransactionType.entrance,
        value: "US\$ 20,00",
        transactionName: "Refund USB-C cable",
      ),
      description: 'Simple transaction component',
    ),
    WidgetPreview(
      widget: const SimpleTransaction(
        type: TransactionType.withdrawal,
        value: "US\$ 20,00",
        transactionName: "USB-C cable",
      ),
      description: 'Simple transaction component withdrawal',
    ),
  ],
);
