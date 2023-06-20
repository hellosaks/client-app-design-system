import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/skeleton/skeleton.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final skeletonDoc = ElementPreview(
  document: SkeletonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const Skeleton(
        height: 200,
        radius: 20,
      ),
      description: 'Skeleton with height and radius',
    ),
    WidgetPreview(
      widget: const Skeleton(
        height: 80,
        width: 80,
        radius: 40,
      ),
      description: 'Skeleton for avatar',
    ),
    WidgetPreview(
      widget: const Skeleton(
        height: 80,
        width: 80,
        radius: 40,
      ),
      description: 'Skeleton for avatar',
    ),
  ],
);
