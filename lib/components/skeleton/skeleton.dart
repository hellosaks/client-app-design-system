import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart";
import "package:shimmer/shimmer.dart";

@docWidget
class Skeleton extends StatelessWidget {
  final double height;
  final double width;
  final double? radius;
  final Widget? child;

  const Skeleton({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.radius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(0.4),
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius != null
              ? BorderRadius.circular(radius!)
              : BorderRadius.circular(ThemeSAKS.shape.borderRadiusCard),
          color: Colors.black.withOpacity(0.4),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
