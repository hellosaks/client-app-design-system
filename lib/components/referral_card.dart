import "package:client_app_design_system/components/cards/lib/components/custom_divider.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:heroicons/heroicons.dart";
import "package:mix/mix.dart";

import "../client_app_design_system.dart";

@docWidget
class ReferralCard extends StatefulWidget {
  final Payment payment;
  final String textBonus;

  const ReferralCard({Key? key, required this.payment, required this.textBonus})
      : super(key: key);

  @override
  State<ReferralCard> createState() => _ReferralCardState();
}

class _ReferralCardState extends State<ReferralCard> {
  bool _expanded = false;
  final styleVBoxText = Mix(crossAxis(CrossAxisAlignment.start));
  final styleVBox = Mix(
    pt(10),
    pl(26),
    pr(20),
    pb(14),
    crossAxis(CrossAxisAlignment.center),
    mainAxis(MainAxisAlignment.spaceBetween),
  );

  final style = Mix(
    crossAxis(CrossAxisAlignment.start),
    pt(20),
    pb(30),
  );
  final style1 = Mix(
    pl(25),
  );
  final style2 = Mix(
    pl(10),
  );
  final boxPending = Mix(
    bgColor(NewThemeSAKS.colors.primary.sky),
    rounded(ThemeSAKS.shape.borderRadiusCard),
    width(315),
  );
  final box = Mix(
    bgColor(NewThemeSAKS.colors.special.leaf),
    rounded(ThemeSAKS.shape.borderRadiusCard),
    width(315),
  );
  final Duration duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: AnimatedContainer(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        color: widget.payment == Payment.paid
            ? NewThemeSAKS.colors.special.leaf
            : NewThemeSAKS.colors.primary.sky,
        width: 315,
        height: _expanded ? 324 : 86,
        duration: duration,
        child: VBox(
          children: [
            HBox(
              mix: styleVBox,
              children: [
                HBox(
                  children: [
                    Icon(
                      props: IconProps(
                        variant: IconVariant.heroicons,
                        heroIconsProps: HeroIconsProps(
                          icon: HeroIcons.user,
                          color: widget.payment == Payment.paid
                              ? NewThemeSAKS.colors.utility.conservative
                              : NewThemeSAKS.colors.primary.sea,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    _buildVertical3Texts(),
                  ],
                ),
                _buildVertical2Texts(),
              ],
            ),
            if (_expanded) ...[
              const CustomDivider(),
              const SizedBox(
                height: 10,
              ),
              Box(
                mix: style,
                child: VBox(children: [
                  _textWithIcon(),
                  _buildHorizontalCircle(),
                  _textWithIcon(),
                  if (widget.payment == Payment.paid) ...[
                    _buildHorizontalCircle(),
                    _textWithIcon(),
                  ],
                ]),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildVertical3Texts() {
    final style = Mix(crossAxis(CrossAxisAlignment.start));

    return VBox(
      mix: style,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          text: widget.textBonus,
          color: NewThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 7,
        ),
        CustomTypography(
          variant: TypographyVariant.h6,
          weight: FontWeight.bold,
          text: "Victor Paulo",
          color: NewThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 7,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: "Pago",
          color: widget.payment == Payment.paid
              ? NewThemeSAKS.colors.utility.conservative
              : NewThemeSAKS.colors.primary.sea,
        ),
      ],
    );
  }

  Widget _buildVertical2Texts() {
    return VBox(
      children: [
        const SizedBox(
          height: 21,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          weight: FontWeight.bold,
          text: "R\$ 25,00",
          color: NewThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 7,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: "12/01/2023",
          color: NewThemeSAKS.colors.primary.sea,
        ),
      ],
    );
  }

  Widget _buildHorizontalCircle() {
    final style = Mix(
      pl(35),
      crossAxis(CrossAxisAlignment.start),
    );
    return HBox(
      mix: style,
      children: [
        VBox(
          children: [
            _buildCircle(),
            const SizedBox(
              height: 10,
            ),
            _buildCircle(),
            const SizedBox(
              height: 10,
            ),
            _buildCircle(),
          ],
        )
      ],
    );
  }

  Widget _buildCircle() {
    final style = Mix(
      crossAxis(CrossAxisAlignment.end),
      height(4),
      width(4),
      bgColor(NewThemeSAKS.colors.utility.conservative),
      rounded(ThemeSAKS.shape.borderRadius),
    );

    return Box(
      mix: style,
      child: const Center(),
    );
  }

  Widget _textWithIcon() {
    final style = Mix(
      pl(25),
    );

    return HBox(
      mix: style,
      children: [
        Icon(
          props: IconProps(
            variant: IconVariant.heroicons,
            heroIconsProps: HeroIconsProps(
              style: HeroIconStyle.solid,
              icon: HeroIcons.checkCircle,
              color: NewThemeSAKS.colors.utility.conservative,
              size: 24,
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        _textExtended(),
      ],
    );
  }

  Widget _textExtended() {
    final style = Mix(
      crossAxis(CrossAxisAlignment.start),
    );

    return VBox(
      mix: style,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          weight: FontWeight.bold,
          text: "Pagamento do plano efetuado",
          color: NewThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: "12/01/2023",
          color: NewThemeSAKS.colors.primary.sea,
        ),
      ],
    );
  }
}
