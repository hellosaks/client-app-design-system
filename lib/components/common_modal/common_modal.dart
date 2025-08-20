import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

class ButtonProperties {
  final void Function() onPressed;
  final String title;

  ButtonProperties({
    required this.onPressed,
    required this.title,
  });
}

@docWidget
class CommonModal extends StatelessWidget {
  final ButtonProperties? onPressButton;
  final ButtonProperties? onCloseButton;
  final ButtonProperties? tertiaryButton;

  final IconProps currentIconProps;
  final String title;
  final String description;
  final double modalHeight;
  final bool? loading;

  const CommonModal({
    required this.currentIconProps,
    required this.title,
    required this.description,
    this.modalHeight = 450,
    this.onPressButton,
    this.onCloseButton,
    this.tertiaryButton,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: modalHeight <= 1
          ? MediaQuery.of(context).size.height * modalHeight
          : modalHeight,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SafeArea(
        child: Column(
          children: [
            ..._buildHeader(),
            const SizedBox(height: 30),
            ..._buildContent(),
            const Spacer(),
            if (listActions.isNotEmpty) ...[
              const SizedBox(height: 40),
              _buildFooter()
            ],
            const Spacer()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      CustomTypography(
        variant: TypographyVariant.h3,
        text: title,
        color: ThemeSAKS.colors.primary.sea,
        align: TextAlign.center,
        weight: FontWeight.w600,
      ),
      const SizedBox(height: 30),
      CustomTypography(
        variant: TypographyVariant.h6,
        text: description,
        selectable: true,
        color: ThemeSAKS.colors.grayscale.strongGrey,
        align: TextAlign.center,
      ),
    ];
  }

  List<Widget> _buildHeader() {
    final icon = currentIconProps.copyWith(
      size: 56,
    );
    return [
      const SizedBox(height: 10),
      Container(
        key: const Key("line-header"),
        height: 8,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: OldThemeSAKS.colors.grayTone.colorGray01,),
      ),
      const SizedBox(height: 40),
      Icon(props: icon)
    ];
  }

  Widget _buildLoadingButton() {
    if (loading == true) {
      return const CircularLoading();
    }

    return SecondaryButton(
      text: onPressButton!.title,
      onPressed: onPressButton!.onPressed,
      colorAttributes: ColorAttributesButton(
        bgColor: ThemeSAKS.colors.primary.sea,
        pressColor: ThemeSAKS.colors.secondary.anchor,
      ),
    );
  }

  List<Widget> get listActions {
    return [
      if (onPressButton != null) _buildLoadingButton(),
      if (onCloseButton != null && loading != true)
        SecondaryButton(
          text: onCloseButton!.title,
          onPressed: onCloseButton!.onPressed,
          outlined: true,
          colorAttributes: ColorAttributesButton(
            insideColor: ThemeSAKS.colors.primary.sea,
            pressColor: ThemeSAKS.colors.secondary.anchor,
          ),
        ),
      if (tertiaryButton != null) ...[
        TertiaryButton(
          text: tertiaryButton!.title,
          onPressed: tertiaryButton!.onPressed,
        )
      ],
    ];
  }

  Widget _buildFooter() {
    return Column(
      children: listActions
          .expand((element) => [element, const SizedBox(height: 20)])
          .toList(),
    );
  }
}
