import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/color_attributes.dart';
import 'package:client_app_design_system/components/buttons/primary_button.dart';
import 'package:client_app_design_system/components/buttons/primary_button.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final withSeaColorProps = ColorAttributesButton(
  bgColor: ThemeSAKS.colors.primary.sea,
  pressColor: ThemeSAKS.colors.secondary.anchor,
);

final leftIconProps = IconProps(
  variant: IconVariant.heroicons,
  heroIconsProps: HeroIconsProps(
    icon: HeroIcons.arrowLeft,
  ),
);

final rightIconProps = IconProps(
  variant: IconVariant.heroicons,
  heroIconsProps: HeroIconsProps(
    icon: HeroIcons.arrowRight,
  ),
);

const text = "Button";

final primaryButtonDoc = ElementPreview(
  document: PrimaryButtonDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: PrimaryButton(
        onPressed: () {},
        colorAttributes: withSeaColorProps,
        leftIcon: leftIconProps,
        text: text,
      ),
      description: '',
    ),
    WidgetPreview(
      widget: PrimaryButton(
        onPressed: () {},
        colorAttributes: withSeaColorProps,
        rightIcon: rightIconProps,
        text: text,
      ),
      description: '',
    ),
    WidgetPreview(
      widget: PrimaryButton(
        onPressed: () {},
        colorAttributes: withSeaColorProps,
        leftIcon: leftIconProps,
        disable: true,
        text: text,
      ),
      description: '',
    ),
  ],
);
