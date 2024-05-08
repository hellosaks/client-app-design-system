import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

@docWidget
class SimpleDownload extends StatelessWidget {
  final String fileName;
  final VoidCallback onPressed;
  final bool downloading;

  const SimpleDownload({
    super.key,
    required this.fileName,
    required this.onPressed,
    required this.downloading,
  });

  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: ThemeSAKS.colors.special.rose.withOpacity(0.15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  props: IconProps(
                    variant: IconVariant.custom,
                    customIconsProps: CustomIconsProps(
                      icon: CustomIcons.icPdf,
                      color: ThemeSAKS.colors.special.rose,
                      size: _iconSize,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            CustomTypography(
              variant: TypographyVariant.h5,
              text: fileName,
            ),
            const Spacer(),
            if (downloading)
              const SizedBox(
                height: _iconSize,
                width: _iconSize,
                child: CircularLoading(),
              )
            else
              Icon(
                props: IconProps(
                  variant: IconVariant.unicons,
                  uniconsProps: UniconsProps(
                    icon: UniconsLine.cloud_download,
                    color: ThemeSAKS.colors.primary.saks,
                    size: _iconSize,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
