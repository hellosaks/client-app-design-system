import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

import "../client_app_design_system.dart";

@docWidget
class ReferralCard extends StatefulWidget {
  const ReferralCard({Key? key}) : super(key: key);

  @override
  State<ReferralCard> createState() => _ReferralCardState();
}

class _ReferralCardState extends State<ReferralCard> {
  bool _expanded = false;
  final styleVBoxText = Mix(crossAxis(CrossAxisAlignment.start));
  final styleVBox = Mix(
    crossAxis(CrossAxisAlignment.center),
    mainAxis(MainAxisAlignment.spaceBetween),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Card(
        color: NewThemeSAKS.colors.special.leaf,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(NewThemeSAKS.shape.borderRadiusCard),
        ),
        child: Column(
          children: [
            HBox(
              mix: styleVBox,
              children: [
                Icon(
                  props: IconProps(
                    variant: IconVariant.heroicons,
                    heroIconsProps: HeroIconsProps(
                      icon: HeroIcons.user,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                VBox(
                  mix: styleVBoxText,
                  children: [
                    CustomTypography(
                      variant: TypographyVariant.h7,
                      text: "Bônus indicação",
                      color: NewThemeSAKS.colors.primary.sea,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h6,
                      weight: FontWeight.bold,
                      text: "Victor  Paulo",
                      color: NewThemeSAKS.colors.primary.sea,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h7,
                      text: "Pago",
                      color: NewThemeSAKS.colors.utility.conservative,
                    ),
                  ],
                ),
                VBox(
                  children: [
                    CustomTypography(
                      variant: TypographyVariant.h7,
                      text: "R\$ 25,00",
                      color: NewThemeSAKS.colors.primary.sea,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h7,
                      text: "12/01/2023",
                      color: NewThemeSAKS.colors.primary.sea,
                    ),
                  ],
                ),
              ],
            ),
            if (_expanded)
              const Padding(
                  padding: EdgeInsets.all(8),
                  child: Box(
                    child: CustomTypography(
                      variant: TypographyVariant.h4,
                      text: "Indicado cadastrado",
                      color: Colors.black,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
