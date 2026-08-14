import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart";

@docWidget
class CircularLoading extends StatelessWidget {
  const CircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.android
        ? CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation(ThemeSAKS.colors.primary.saks),
          )
        : const CircularProgressIndicator.adaptive(
            backgroundColor: Colors.black,
          );
  }
}
