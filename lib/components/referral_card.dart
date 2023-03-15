import "package:client_app_design_system/components/cards/lib/components/custom_divider.dart";
import "package:client_app_design_system/utils/data_label.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:heroicons/heroicons.dart";
import "package:mix/mix.dart";

import "../client_app_design_system.dart";

@docWidget
class ReferralCard extends StatefulWidget {
  final Payment payment;
  final String textBonus;
  final String name;
  final String valueBonus;
  final IconProps icon;
  final String textPaid;

  final String dateCard;
  final DataLabel dataLabel;
  final void Function() onPressed;

  const ReferralCard(
      {Key? key,
      required this.payment,
      required this.textBonus,
      required this.name,
      required this.dateCard,
      required this.valueBonus,
      required this.dataLabel,
      required this.icon,
      required this.onPressed,
      required this.textPaid})
      : super(key: key);

  static const Key circleKey = Key("circleKey");
  static const Key cardKey = Key("cardKey");

  @override
  State<ReferralCard> createState() => _ReferralCardState();
}

class _ReferralCardState extends State<ReferralCard>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 125),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  bool _expanded = false;
  final styleVBox = Mix(
    pt(10),
    pl(26),
    pr(20),
    pb(14),
    crossAxis(CrossAxisAlignment.center),
    mainAxis(MainAxisAlignment.spaceBetween),
  );

  @override
  Widget build(BuildContext context) {
    final box = Mix(
      bgColor(widget.payment == Payment.paid
          ? ThemeSAKS.colors.special.leaf
          : ThemeSAKS.colors.primary.sky),
      rounded(ThemeSAKS.shape.borderRadiusCard),
      width(315),
      //  height(_expanded ? 324 : 86),
    );

    return GestureDetector(
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
          widget.onPressed();

          _expanded ? _controller.forward() : _controller.reverse();
        },
        child: Box(
          mix: box,
          key: ReferralCard.cardKey,
          child: VBox(
            children: [
              HBox(
                mix: styleVBox,
                children: [
                  HBox(
                    children: [
                      _buildIcon(),
                      const SizedBox(
                        width: 24,
                      ),
                      _buildVertical3Texts(),
                    ],
                  ),
                  _buildVertical2Texts(),
                ],
              ),
              _buildExtendedCard(),
            ],
          ),
        ));
  }

  Widget _buildIcon() {
    if (widget.icon.variant == IconVariant.heroicons) {
      widget.icon.heroIconsProps?.color = Payment.paid == widget.payment
          ? ThemeSAKS.colors.utility.conservative
          : ThemeSAKS.colors.primary.sea;
      widget.icon.heroIconsProps?.size = 30;
    }
    if (widget.icon.variant == IconVariant.unicons) {
      widget.icon.heroIconsProps?.color = ThemeSAKS.colors.utility.conservative;
      widget.icon.heroIconsProps?.size = 30;
    }
    return Icon(
      props: widget.icon,
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
          color: ThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 7,
        ),
        CustomTypography(
          variant: TypographyVariant.h6,
          weight: FontWeight.bold,
          text: widget.name,
          color: ThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 7,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: widget.textPaid,
          color: widget.payment == Payment.paid
              ? ThemeSAKS.colors.utility.conservative
              : ThemeSAKS.colors.primary.sea,
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
          text: widget.valueBonus,
          color: ThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 7,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: widget.dateCard,
          color: ThemeSAKS.colors.primary.sea,
        ),
      ],
    );
  }

  Widget _buildExtendedCard() {
    final style = Mix(
      crossAxis(CrossAxisAlignment.start),
      pt(20),
      pb(30),
    );
    return SizeTransition(
      sizeFactor: _animation,
      child: VBox(children: [
        const CustomDivider(),
        const SizedBox(
          height: 10,
        ),
        Box(
          mix: style,
          child: VBox(children: [
            _textWithIcon(),
            for (int i = 1; i < widget.dataLabel.label.length; i++)
              _textWithIconList(i),
          ]),
        )
      ]),
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
              color: ThemeSAKS.colors.utility.conservative,
              size: 24,
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        _textExtended(0),
      ],
    );
  }

  Widget _textWithIconList(int index) {
    final style = Mix(
      pl(25),
    );
    return VBox(children: [
      _buildVerticalCircles(index),
      HBox(
        mix: style,
        children: [
          if (widget.dataLabel.data.length == index) ...[
            _buildCircleIcon(),
          ] else ...[
            Icon(
              props: IconProps(
                variant: IconVariant.heroicons,
                heroIconsProps: HeroIconsProps(
                  style: HeroIconStyle.solid,
                  icon: HeroIcons.checkCircle,
                  color: widget.dataLabel.data.length == index
                      ? ThemeSAKS.colors.primary.sea
                      : ThemeSAKS.colors.utility.conservative,
                  size: 24,
                ),
              ),
            ),
          ],
          const SizedBox(
            width: 24,
          ),
          _textExtended(index),
        ],
      ),
    ]);
  }

  Widget _textExtended(int index) {
    final style = Mix(
      crossAxis(CrossAxisAlignment.start),
    );
    final styleText = Mix(
      opacity(widget.dataLabel.data.length == index ? 0.5 : 1),
    );

    return VBox(
      mix: style,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          weight: FontWeight.bold,
          text: widget.dataLabel.label[index],
          color: ThemeSAKS.colors.primary.sea,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTypography(
          mix: styleText,
          variant: TypographyVariant.h7,
          text: widget.dataLabel.data.length == index
              ? "_"
              : widget.dataLabel.data[index],
          color: ThemeSAKS.colors.primary.sea,
        ),
      ],
    );
  }

  Widget _buildCircleIcon() {
    final style = Mix(
      height(19.5),
      width(19.5),
      bgColor(ThemeSAKS.colors.primary.sea),
      opacity(0.2),
      rounded(ThemeSAKS.shape.borderRadius),
    );
    final styleBox = Mix(
      height(24),
      width(24),
    );

    return Box(
      mix: styleBox,
      child: Box(
        mix: style,
        child: const Center(),
      ),
    );
  }

  Widget _buildVerticalCircles(int index) {
    final style = Mix(
      pl(35),
      crossAxis(CrossAxisAlignment.start),
    );
    return HBox(
      key: ReferralCard.circleKey,
      mix: style,
      children: [
        VBox(
          children: [
            _buildCircle(index),
            const SizedBox(
              height: 10,
            ),
            _buildCircle(index),
            const SizedBox(
              height: 10,
            ),
            _buildCircle(index),
          ],
        )
      ],
    );
  }

  Widget _buildCircle(int index) {
    final style = Mix(
      crossAxis(CrossAxisAlignment.end),
      opacity(widget.dataLabel.data.length == index ? 0.2 : 1),
      height(4),
      width(4),
      bgColor(widget.dataLabel.data.length == index
          ? ThemeSAKS.colors.primary.sea
          : ThemeSAKS.colors.utility.conservative),
      rounded(ThemeSAKS.shape.borderRadius),
    );

    return Box(
      mix: style,
      child: const Center(),
    );
  }
}
