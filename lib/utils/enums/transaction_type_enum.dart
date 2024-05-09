import "package:client_app_design_system/utils/enums/enums_dto.dart";

enum TransactionType { entrance, withdrawal }

class SimpleTransactionEnum extends EnumDto<TransactionType> {
  @override
  TransactionType? canParse(String enumType) {
    switch (enumType) {
      case "entrance":
        return TransactionType.entrance;
      case "withdrawal":
        return TransactionType.withdrawal;
    }
    return null;
  }

  @override
  TransactionType get defaultEnum => TransactionType.entrance;

  @override
  String stringfy(TransactionType enumType) {
    switch (enumType) {
      case TransactionType.entrance:
        return "entrance";
      case TransactionType.withdrawal:
        return "withdrawal";
    }
  }
}
