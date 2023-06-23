import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

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
      height: modalHeight,
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
            SizedBox(height: AppSize().getHeight(24)),
            ..._buildContent(),
            const Spacer(),
            if (listActions.isNotEmpty) ...[
              SizedBox(height: AppSize().getHeight(40)),
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
        variant: TypographyVariant.h4,
        text: title,
        color: ThemeSAKS.colors.primary.saks,
        align: TextAlign.center,
        weight: FontWeight.w600,
      ),
      SizedBox(height: AppSize().getHeight(10)),
      CustomTypography(
        variant: TypographyVariant.h4,
        text: description,
        color: ThemeSAKS.colors.secondary.anchor,
        align: TextAlign.center,
      ),
    ];
  }

  List<Widget> _buildHeader() {
    final icon = currentIconProps.copyWith(
      color: ThemeSAKS.colors.primary.saks,
      size: 50,
    );
    final styles = Mix(
      height(8),
      width(40),
      bgColor(OldThemeSAKS.colors.grayTone.colorGray01),
      rounded(5),
    );
    return [
      SizedBox(height: AppSize().getHeight(10)),
      Box(
        key: const Key("line-header"),
        mix: styles,
      ),
      SizedBox(height: AppSize().getHeight(33)),
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
          .expand(
            (element) => [element, SizedBox(height: AppSize().getHeight(20))],
          )
          .toList(),
    );
  }
}
