import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

@docWidget
class IndicationFilters extends StatelessWidget {
  final String text;
  final int number;
  final Filter filter;
  final bool isSelected;

  final void Function() onPressed;

  const IndicationFilters({
    super.key,
    required this.text,
    required this.filter,
    required this.number,
    required this.onPressed,
    this.isSelected = false,
  });

  static const ValueKey circleKey = ValueKey("circleKey");

  static const ValueKey vboxKey = ValueKey("vboxKey");
  static const ValueKey pressableKey = ValueKey("pressableKey");

  @override
  Widget build(BuildContext context) {
    final hboxStyles = Mix(
      mainAxis(MainAxisAlignment.spaceBetween),
      crossAxis(CrossAxisAlignment.end),
    );

    final isNotSelectedStyles = Mix(
      bgColor(
        filter == Filter.activated
            ? ThemeSAKS.colors.special.leaf
            : ThemeSAKS.colors.primary.sky,
      ),
    );

    final vboxStyles = Mix(
      mainAxis(MainAxisAlignment.start),
      crossAxis(CrossAxisAlignment.start),
      rounded(10),
      w(155),
    );
    final styles = Mix.combine(
      vboxStyles,
      isNotSelectedStyles,
    );
    final Mix pressableStyles = Mix(
      rounded(10),
      padding(20),
      bgColor(
        isSelected
            ? ThemeSAKS.colors.primary.sea.withOpacity(0.15)
            : Colors.transparent,
      ),
      animated(),
    );

    return Pressable(
      key: IndicationFilters.pressableKey,
      mix: styles,
      onPressed: () {
        onPressed();
      },
      child: VBox(
        key: IndicationFilters.vboxKey,
        mix: pressableStyles,
        children: [
          _buildTitle(),
          const SizedBox(height: 16),
          HBox(
            mix: hboxStyles,
            children: [
              _buildCircle(),
              _buildArrow(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return CustomTypography(
      text: text,
      variant: TypographyVariant.h4,
      weight: FontWeight.bold,
      color: ThemeSAKS.colors.primary.sea,
    );
  }

  Widget _buildCircle() {
    final circleStyle = Mix(
      height(40),
      width(40),
      bgColor(
        filter == Filter.activated
            ? ThemeSAKS.colors.utility.conservative
            : ThemeSAKS.colors.primary.sea,
      ),
      rounded(ThemeSAKS.shape.borderRadius),
    );

    return Box(
      key: IndicationFilters.circleKey,
      mix: circleStyle,
      child: Center(
        child: CustomTypography(
          text: number.toString(),
          variant: TypographyVariant.h4,
          weight: FontWeight.bold,
          color: ThemeSAKS.colors.special.leaf,
        ),
      ),
    );
  }

  Widget _buildArrow() {
    return Icon(
      props: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: HeroIcons.arrowRightCircle,
          color: ThemeSAKS.colors.primary.sea,
          size: 24,
        ),
      ),
    );
  }
}
