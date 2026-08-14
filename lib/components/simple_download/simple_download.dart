import "dart:async";

import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart" hide Icon;

@docWidget
class SimpleDownload extends StatefulWidget {
  final String fileName;
  final Future<void> Function() onPressed;
  final bool? downloading;
  final Future<bool> Function() checkPermission;
  final Future<void> Function() requestPermission;
  final VoidCallback onDeniedPermissionCallback;

  const SimpleDownload({
    super.key,
    required this.fileName,
    required this.onPressed,
    required this.checkPermission,
    required this.requestPermission,
    required this.onDeniedPermissionCallback,
    this.downloading,
  });

  static const double _iconSize = 24;

  @override
  State<SimpleDownload> createState() => _SimpleDownloadState();
}

class _SimpleDownloadState extends State<SimpleDownload> {
  bool _downloading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onDownload,
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
                      size: SimpleDownload._iconSize,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            CustomTypography(
              variant: TypographyVariant.h5,
              text: widget.fileName,
            ),
            const Spacer(),
            if (downloading)
              const SizedBox(
                height: SimpleDownload._iconSize,
                width: SimpleDownload._iconSize,
                child: CircularLoading(),
              )
            else
              Icon(
                props: IconProps(
                  variant: IconVariant.unicons,
                  uniconsProps: UniconsProps(
                    icon: UniconsLine.cloud_download,
                    color: ThemeSAKS.colors.primary.saks,
                    size: SimpleDownload._iconSize,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  bool get downloading {
    return widget.downloading ?? _downloading;
  }

  Future<bool> requestPermissionAndCheck() async {
    await widget.requestPermission();
    return widget.checkPermission();
  }

  Future<void> onDownload() async {
    final isPermitted = await widget.checkPermission();
    if (!isPermitted) {
      final permissionRequestedAndGranted = await requestPermissionAndCheck();
      if (!permissionRequestedAndGranted) {
        widget.onDeniedPermissionCallback();
        return;
      }
    }

    setState(() => _downloading = true);
    await widget.onPressed();
    setState(() => _downloading = false);
  }
}
