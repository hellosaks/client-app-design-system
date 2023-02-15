import "package:flutter/material.dart";

Widget wrapWithMaterialApp(Widget widget) {
  return MaterialApp(
    home: Scaffold(body: widget),
  );
}
