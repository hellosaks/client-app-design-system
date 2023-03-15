import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/icon.doc_widget.dart';
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
            color: ThemeSAKS.colors.primary.saks,
            size: 40,
          ),
        ),
      ),
      description:
          'Example icon for unicons, with 40 px size and primary saks color',
    ),
    WidgetPreview(
      widget: Icon(
        props: IconProps(
          variant: IconVariant.heroicons,
          heroIconsProps: HeroIconsProps(
            icon: HeroIcons.academicCap,
            color: ThemeSAKS.colors.primary.sea,
            size: 40,
          ),
        ),
      ),
      description:
          'Example icon for heroicons, with 40 px size and primary sea color',
    ),
  ],
);
