import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/icon.doc_widget.dart';
import 'package:client_app_design_system/utils/enums.dart';
import 'package:doc_widget/doc_widget.dart';

final iconDoc = ElementPreview(
  document: IconDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: Icon(
        props: IconProps(
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.calculator,
          ),
        ),
      ),
      description: 'Example icon for unicons',
    ),
    WidgetPreview(
      widget: Icon(
        props: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.academicCap,
          ),
        ),
      ),
      description: 'Example icon for heroicons',
    ),
  ],
);
