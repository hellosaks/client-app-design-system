class DataLabel {
  List<String> data;
  List<String> label;

  DataLabel({required this.data, required this.label}) {
    if (label.length != data.length) {
      if (label.length != data.length + 1) {
        throw Exception(
            "The number of elements in the lists must be the same, the date can be one less element");
      }
    }
  }
}
