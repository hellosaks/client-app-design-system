import 'package:client_app_design_system/components/simple_download/simple_download.dart';
import 'package:client_app_design_system/components/simple_download/simple_download.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final simpleDownloadDoc = ElementPreview(
  document: SimpleDownloadDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: SimpleDownload(
        fileName: "isin_id_saks_global.pdf",
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 5));
        },
        checkPermission: () async {
          return true;
        },
        onDeniedPermissionCallback: () {},
        requestPermission: () {},
      ),
      description: 'Simple download',
    ),
    WidgetPreview(
      widget: SimpleDownload(
        fileName: "isin_id_saks_global.pdf",
        onPressed: () async {},
        checkPermission: () async => true,
        onDeniedPermissionCallback: () {},
        requestPermission: () {},
        downloading: true,
      ),
      description: 'Simple download with loading',
    ),
  ],
);
