import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/theme/theme_saks.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:flutter/material.dart";
import "package:heroicons/heroicons.dart";
import "package:mix/mix.dart";

class IndicationFilters extends StatelessWidget {
  const IndicationFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Mix(
      mainAxis(MainAxisAlignment.spaceBetween),
    );
    return SizedBox(
      height: 119,
      width: 310,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: ThemeSAKS.colors.special.leaf,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: VBox(
            children: [
              CustomTypography(
                text: "Ativados",
                variant: TypographyVariant.h4,
                weight: FontWeight.bold,
                color: ThemeSAKS.colors.primary.sea,
              ),
              HBox(
                mix: styles,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeSAKS.colors.utility.conservative,
                    ),
                    child: Center(
                      child: CustomTypography(
                        text: "1",
                        variant: TypographyVariant.h4,
                        weight: FontWeight.bold,
                        color: ThemeSAKS.colors.special.leaf,
                      ),
                    ),
                  ),
                  IconButton(
                    // splashRadius: ThemeSAKS.shape.iconButtonSplashRadius,
                    // visualDensity: VisualDensity.compact,
                    onPressed: (() {}),
                    icon: HeroIcon(
                      HeroIcons.arrowRightCircle,
                      style: HeroIconStyle.outline,
                      color: ThemeSAKS.colors.primary.sea,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
