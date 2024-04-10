abstract class EnumDto<T> {
  T get defaultEnum;
  String stringfy(T enumType);
  T? canParse(String enumType);

  T parse(String enumType) {
    final canParse = this.canParse(enumType);
    return canParse ?? defaultEnum;
  }
}

abstract class SerializableJson<T> {
  // ignore: avoid_unused_constructor_parameters
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
