import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:playground/widgets/custom_typography.dart';

void main() {
  runApp(DocPreview(sections: [
    ElementsSection(
      title: 'Widgets',
      elements: [customTypographyDoc],
    )
  ]));
}
