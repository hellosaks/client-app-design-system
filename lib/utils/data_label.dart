class DataLabel {
  List<String> data;
  List<String> label;

  DataLabel({required this.data, required this.label}) {
    if (label.length != data.length) {
      if (label.length != data.length + 1) {
        throw Exception(
            "O número de elementos nas listas devem ser o mesmos, a data pode ter um elemento a menos");
      }
    }
  }
}
