import "package:client_app_design_system/theme/theme_saks.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart";

@docWidget
class CustomAccordion extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  final Color? iconColor;
  final Color backgroundColor;
  final Color collapsedBackgroundColor;
  final double? borderRadius;

  final bool initiallyExpanded;
  final ListTileControlAffinity controlAffinity;

  const CustomAccordion({
    super.key,
    required this.children,
    required this.title,
    required this.backgroundColor,
    required this.collapsedBackgroundColor,
    this.controlAffinity = ListTileControlAffinity.trailing,
    this.iconColor,
    this.borderRadius,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius ?? ThemeSAKS.shape.borderRadius,
        ),
        child: ExpansionTile(
          controlAffinity: controlAffinity,
          initiallyExpanded: initiallyExpanded,
          expandedCrossAxisAlignment: CrossAxisAlignment.end,
          backgroundColor: backgroundColor,
          collapsedBackgroundColor: collapsedBackgroundColor,
          collapsedIconColor: iconColor ?? ThemeSAKS.colors.primary.saks,
          iconColor: iconColor ?? ThemeSAKS.colors.primary.saks,
          expandedAlignment: Alignment.topRight,
          title: title,
          childrenPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          children: children,
        ),
      ),
    );
  }
}
