abstract class EnumDto<T> {
  String stringfy(T enumType);
  T parse(String enumType);
}

abstract class SerializableJson<T> {
  // ignore: avoid_unused_constructor_parameters
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
