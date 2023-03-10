import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

import "../client_app_design_system.dart";

class ReferralCard extends StatefulWidget {
  const ReferralCard({Key? key}) : super(key: key);

  @override
  State<ReferralCard> createState() => _ReferralCardState();
}

class _ReferralCardState extends State<ReferralCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(26, 10, 20, 14),
        color: NewThemeSAKS.colors.special.leaf,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            HBox(
              children: [
                Icon(
                  props: IconProps(
                    variant: IconVariant.heroicons,
                    heroIconsProps: HeroIconsProps(
                      icon: HeroIcons.clipboardDocument,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                const VBox(
                  children: [
                    CustomTypography(
                      variant: TypographyVariant.h4,
                      text: "Bônus indicação",
                      color: Colors.black,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h4,
                      text: "Victor  Paulo",
                      color: Colors.black,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h4,
                      text: "Pago",
                      color: Colors.black,
                    ),
                  ],
                ),
                const VBox(
                  children: [
                    CustomTypography(
                      variant: TypographyVariant.h4,
                      text: "R\$ 25,00",
                      color: Colors.black,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h4,
                      text: "12/01/2023",
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "widget.title",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (_expanded)
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  " widget.description",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
