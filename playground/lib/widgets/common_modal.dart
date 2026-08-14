import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/common_modal/common_modal.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:material_ui/material_ui.dart';

final commonModalDoc = ElementPreview(
  document: CommonModalDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
        ),
      ),
      description: 'Example common modal',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
        ),
      ),
      description: 'Example common modal with onPress button',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
          onCloseButton:
              ButtonProperties(onPressed: () {}, title: "Close modal"),
        ),
      ),
      description: 'Example common modal with onClose button',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
          onCloseButton:
              ButtonProperties(onPressed: () {}, title: "Close modal"),
          tertiaryButton:
              ButtonProperties(onPressed: () {}, title: "Tertiary button"),
        ),
      ),
      description: 'Example common modal with tertiary button',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          currentIconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(icon: UniconsLine.abacus),
          ),
          description: "Example common modal",
          title: "Example common modal",
          onPressButton:
              ButtonProperties(onPressed: () {}, title: "Click here"),
          onCloseButton:
              ButtonProperties(onPressed: () {}, title: "Close modal"),
          tertiaryButton:
              ButtonProperties(onPressed: () {}, title: "Tertiary button"),
          loading: true,
        ),
      ),
      description: 'Example common modal with loading',
    ),
    WidgetPreview(
      widget: Container(
        color: Colors.grey[50],
        width: double.infinity,
        child: CommonModal(
          modalHeight: 0.65,
          currentIconProps: IconProps(
            variant: IconVariant.custom,
            customIconsProps: CustomIconsProps(
              icon: CustomIcons.icPiggyBank,
              color: ThemeSAKS.colors.primary.sea,
            ),
          ),
          description:
              "Em nossa tela de destaque, você encontrará uma seleção cuidadosamente elaborada dos melhores fundos de investimentos em previdência disponíveis.\n\nEsses fundos são escolhidos com base em sua performance consistente, gestão especializada e potencial para impulsionar seus investimentos no longo prazo.",
          title: "Investimentos em\nPrevidência Privada",
          onPressButton: ButtonProperties(
            onPressed: () {},
            title: "Ver planos de Previdência",
          ),
        ),
      ),
      description: 'Example common modal with loading',
    ),
  ],
);
