import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/icon/icon.doc_widget.dart';
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
          variant: IconVariant.unicons,
          uniconsProps: UniconsProps(
            icon: UniconsLine.abacus,
            color: ThemeSAKS.colors.primary.sea,
            size: 40,
          ),
        ),
      ),
      description:
          'Example icon for heroicons, with 40 px size and primary sea color',
    ),
    WidgetPreview(
      widget: Icon(
        props: IconProps(
          variant: IconVariant.custom,
          customIconsProps: CustomIconsProps(
            icon: CustomIcons.icWhatsapp,
            color: ThemeSAKS.colors.primary.sea,
            size: 40,
          ),
        ),
      ),
      description:
          'Example icon for custom, with 40 px size and primary sea color',
    ),
  ],
);
