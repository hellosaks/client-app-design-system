import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/buttons/button_tertiary.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final withSeaColor = [
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.primary.sea,
          pressColor: NewThemeSAKS.colors.secondary.ice),
      leftIcon: HeroIcons.arrowLeft,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.primary.sea,
          pressColor: NewThemeSAKS.colors.secondary.ice),
      rightIcon: HeroIcons.arrowRight,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.primary.sea,
          pressColor: NewThemeSAKS.colors.secondary.ice),
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.primary.sea,
          pressColor: NewThemeSAKS.colors.secondary.ice),
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.primary.sea,
          pressColor: NewThemeSAKS.colors.secondary.ice),
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: '',
  ),
];
final withDangerColor = [
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.utility.aggressive,
          pressColor: NewThemeSAKS.colors.special.rose
          // NewThemeSAKS.colors.special.rose
          ),
      leftIcon: HeroIcons.arrowLeft,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
        bgColor: NewThemeSAKS.colors.utility.aggressive,
        pressColor: NewThemeSAKS.colors.special.rose,
      ),
      rightIcon: HeroIcons.arrowRight,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.utility.aggressive,
          pressColor: NewThemeSAKS.colors.special.rose),
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.utility.aggressive,
          pressColor: NewThemeSAKS.colors.special.rose),
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      colorAttributes: ColorAttributesButton(
          bgColor: NewThemeSAKS.colors.utility.aggressive,
          pressColor: NewThemeSAKS.colors.special.rose),
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: '',
  ),
];
final withPrimaryColor = [
  WidgetPreview(
    widget: ButtonTertiary(
      leftIcon: HeroIcons.arrowLeft,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      rightIcon: HeroIcons.arrowRight,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      underline: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      strikethrough: true,
      onPressed: () {},
      text: 'Button',
    ),
    description: '',
  ),
  WidgetPreview(
    widget: ButtonTertiary(
      onPressed: () {},
      text: 'Button disable',
      disable: true,
    ),
    description: '',
  ),
];

final buButtonDoc = ElementPreview(
  document: ButtonTertiaryDocWidget(),
  previews: [...withPrimaryColor, ...withSeaColor, ...withDangerColor],
);
