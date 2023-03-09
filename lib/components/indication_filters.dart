import "package:client_app_design_system/utils/enums.dart";
import "package:flutter/material.dart";
import "package:heroicons/heroicons.dart";
import "package:mix/mix.dart";

import "../theme/theme_saks.dart";
import "custom_typography.dart";

class IndicationFilters extends StatefulWidget {
  final String text;
  final Filter filter;
  final String number;

  const IndicationFilters({
    Key? key,
    required this.text,
    required this.filter,
    required this.number,
  }) : super(key: key);

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
    return Opacity(
      opacity: isOpacity ? 0.40 : 1,
      child: SizedBox(
        width: 155,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: widget.filter == Filter.activated
              ? ThemeSAKS.colors.special.leaf
              : ThemeSAKS.colors.primary.sky,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: VBox(
              mix: vboxStyles,
              children: [
                CustomTypography(
                  text: widget.text,
                  variant: TypographyVariant.h4,
                  weight: FontWeight.bold,
                  color: ThemeSAKS.colors.primary.sea,
                ),
                const SizedBox(
                  height: 16,
                ),
                HBox(
                  mix: hboxStyles,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.filter == Filter.activated
                            ? ThemeSAKS.colors.utility.conservative
                            : ThemeSAKS.colors.primary.sea,
                      ),
                      child: Center(
                        child: CustomTypography(
                          text: widget.number,
                          variant: TypographyVariant.h4,
                          weight: FontWeight.bold,
                          color: ThemeSAKS.colors.special.leaf,
                        ),
                      ),
                    ),
                    VBox(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isOpacity = !isOpacity;
                            });
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: HeroIcon(
                            HeroIcons.arrowRightCircle,
                            style: HeroIconStyle.outline,
                            color: ThemeSAKS.colors.primary.sea,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
