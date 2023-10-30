import "package:client_app_design_system/theme/theme_saks.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";

@docWidget
class CustomAccordion extends StatelessWidget {
  final Widget title;
  final List<Widget> children;

  final Color? iconColor;
  final Color backgroundColor;
  final Color collapsedBackgroundColor;

  final bool initiallyExpanded;

  const CustomAccordion({
    super.key,
    required this.children,
    required this.title,
    required this.backgroundColor,
    required this.collapsedBackgroundColor,
    this.iconColor,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.white),
      child: ListTileTheme(
        dense: false,
        child: ExpansionTile(
          controlAffinity: ListTileControlAffinity.leading,
          initiallyExpanded: initiallyExpanded,
          expandedCrossAxisAlignment: CrossAxisAlignment.end,
          backgroundColor: backgroundColor,
          collapsedBackgroundColor: Colors.white,
          collapsedIconColor: iconColor ?? ThemeSAKS.colors.primary.saks,
          iconColor: iconColor ?? ThemeSAKS.colors.primary.saks,
          expandedAlignment: Alignment.topRight,
          title: title,
          childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
          children: children,
        ),
      ),
    );
  }
}
