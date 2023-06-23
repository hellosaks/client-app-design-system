import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

Widget wrapWithMaterialApp(Widget widget) {
  return MaterialApp(
    home: Scaffold(body: widget),
  );
}

Widget wrapWithJsonBuilder(dynamic jsonComponent, JsonWidgetRegistry registry) {
  return wrapWithMaterialApp(
    LayoutBuilder(
      builder: (context, constraints) {
        return JsonWidgetData.fromDynamic(
          jsonComponent,
          registry: registry,
        )!
            .build(context: context);
      },
    ),
  );
}

void bindComponents<T extends JsonWidgetBuilder>(
  JsonWidgetRegistry registry,
  Map<String, BuilderConstructorWidget> builders,
) {
  for (final builder in builders.entries) {
    registry.registerCustomBuilder(
      builder.key,
      JsonWidgetBuilderContainer(
        builder: (map, {registry}) =>
            builder.value(map as Map<dynamic, dynamic>, registry: registry),
      ),
    );
  }
}

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  final exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint("Ignored Error");
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
