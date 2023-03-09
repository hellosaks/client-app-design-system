import "package:client_app_design_system/utils/enums.dart";
import "package:flutter/material.dart" hide Icon;
import "package:heroicons/heroicons.dart";
import "package:mix/mix.dart";

import "../theme/theme_saks.dart";
import "custom_typography.dart";
import "icon.dart";

class IndicationFilters extends StatefulWidget {
  final String text;
  final String number;
  final Filter filter;

  final void Function() onPressed;

  const IndicationFilters({
    Key? key,
    required this.text,
    required this.filter,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  static const ValueKey circleKey = ValueKey("circleKey");
  static const ValueKey cardKey = ValueKey("cardKey");
  static const ValueKey boxKey = ValueKey("boxKey");

  @override
  State<IndicationFilters> createState() => _IndicationFiltersState();
}

class _IndicationFiltersState extends State<IndicationFilters> {
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    final hboxStyles = Mix(
      mainAxis(MainAxisAlignment.spaceBetween),
    );
    final vboxStyles = Mix(
      mainAxis(MainAxisAlignment.start),
      crossAxis(CrossAxisAlignment.start),
    );
    final Mix pressableStyles = Mix(rounded(20));
    final Mix boxStyle =
        Mix(bgColor(NewThemeSAKS.colors.primary.sea), rounded(20));

    return Box(
      key: IndicationFilters.boxKey,
      mix: isOpacity ? boxStyle : null,
      child: Opacity(
          opacity: isOpacity ? 0.40 : 1,
          child: SizedBox(
            width: 155,
            child: Pressable(
              mix: pressableStyles,
              onPressed: () {
                widget.onPressed();
                setState(() {
                  isOpacity = !isOpacity;
                });
              },
              child: Container(
                key: IndicationFilters.cardKey,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: widget.filter == Filter.activated
                      ? NewThemeSAKS.colors.special.leaf
                      : NewThemeSAKS.colors.primary.sky,
                ),
                padding: const EdgeInsets.all(20.0),
                child: VBox(
                  mix: vboxStyles,
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
              ),
            ),
          )),
    );
  }

  Widget _buildTitle() {
    return CustomTypography(
      text: widget.text,
      variant: TypographyVariant.h4,
      weight: FontWeight.bold,
      color: NewThemeSAKS.colors.primary.sea,
    );
  }

  Widget _buildCircle() {
    return Container(
      key: IndicationFilters.circleKey,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.filter == Filter.activated
            ? NewThemeSAKS.colors.utility.conservative
            : NewThemeSAKS.colors.primary.sea,
      ),
      child: Center(
        child: CustomTypography(
          text: widget.number,
          variant: TypographyVariant.h4,
          weight: FontWeight.bold,
          color: NewThemeSAKS.colors.special.leaf,
        ),
      ),
    );
  }

  Widget _buildArrow() {
    return VBox(
      children: [
        const SizedBox(height: 18),
        Icon(
          props: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              icon: HeroIcons.arrowRightCircle,
              color: NewThemeSAKS.colors.primary.sea,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
