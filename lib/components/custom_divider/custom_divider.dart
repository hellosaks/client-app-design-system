import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart";

@docWidget
class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? ThemeSAKS.colors.grayscale.division,
      thickness: 1,
      height: 1,
    );
  }
}
