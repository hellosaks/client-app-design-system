import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

@docWidget
class IndicationFilters extends StatefulWidget {
  final String text;
  final int number;
  final Filter filter;

  final void Function() onPressed;

  const IndicationFilters({
    super.key,
    required this.text,
    required this.filter,
    required this.number,
    required this.onPressed,
  });

  static const ValueKey circleKey = ValueKey("circleKey");
  static const ValueKey boxKey = ValueKey("boxKey");
  static const ValueKey vboxKey = ValueKey("vboxKey");
  static const ValueKey pressableKey = ValueKey("pressableKey");

  @override
  State<IndicationFilters> createState() => _IndicationFiltersState();
}

class _IndicationFiltersState extends State<IndicationFilters> {
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    final hboxStyles = Mix(
      mainAxis(MainAxisAlignment.spaceBetween),
      crossAxis(CrossAxisAlignment.end),
    );
    final vboxStyles = Mix(
      mainAxis(MainAxisAlignment.start),
      crossAxis(CrossAxisAlignment.start),
      bgColor(
        widget.filter == Filter.activated
            ? ThemeSAKS.colors.special.leaf
            : ThemeSAKS.colors.primary.sky,
      ),
      padding(20),
    );
    final Mix pressableStyles = Mix(
      w(155),
      opacity(isOpacity ? 0.85 : 1),
      animated(),
    );
    final Mix boxStyle = Mix(
      bgColor(ThemeSAKS.colors.primary.sea),
    );

    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(ThemeSAKS.shape.borderRadiusCard),
      ),
      child: Box(
        key: IndicationFilters.boxKey,
        mix: boxStyle,
        child: Pressable(
          key: IndicationFilters.pressableKey,
          mix: pressableStyles,
          onPressed: () {
            widget.onPressed();
            setState(() {
              isOpacity = !isOpacity;
            });
          },
          child: VBox(
            key: IndicationFilters.vboxKey,
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
    );
  }

  Widget _buildTitle() {
    return CustomTypography(
      text: widget.text,
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
        widget.filter == Filter.activated
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
          text: widget.number.toString(),
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
