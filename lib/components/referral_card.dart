import "package:client_app_design_system/components/cards/lib/components/custom_divider.dart";
import "package:client_app_design_system/components/custom_typography.dart";
import "package:client_app_design_system/components/icon.dart";
import "package:client_app_design_system/theme/theme_saks.dart";
import "package:client_app_design_system/utils/app_size.dart";
import "package:client_app_design_system/utils/constants.dart";
import "package:client_app_design_system/utils/data_label.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:get/get.dart";
import "package:heroicons/heroicons.dart";
import "package:mix/mix.dart";

@docWidget
class ReferralCard extends StatefulWidget {
  final Payment payment;
  final String textBonus;
  final String name;
  final String valueBonus;
  final IconProps icon;
  final String textPaid;

  final String dateCard;
  final List<DataLabel> dataLabel;
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
              _buildClosedCardInfo(),
              _buildExtendedCard(),
            ],
          ),
        ));
  }

  Widget _buildClosedCardInfo() {
    return HBox(
      mix: styleVBox,
      children: [
        _buildIconWith3Texts(),
        _buildVertical2Texts(),
      ],
    );
  }

  Widget _buildIconWith3Texts() {
    return HBox(
      children: [
        _buildIcon(),
        const SizedBox(
          width: 24,
        ),
        _buildVertical3Texts(),
      ],
    );
  }

  IconProps get iconProps {
    final IconVariant iconVariant = widget.icon.variant;

    double size = AppSize(context: Get.context).getHeight(30);

    switch (iconVariant) {
      case IconVariant.heroicons:
        final HeroIconsProps heroIconProps = widget.icon.heroIconsProps!;

        heroIconProps.color = Payment.paid == widget.payment
            ? ThemeSAKS.colors.utility.conservative
            : ThemeSAKS.colors.primary.sea;
        ;
        heroIconProps.size = size;
        return IconProps(variant: iconVariant, heroIconsProps: heroIconProps);

      case IconVariant.unicons:
        final UniconsProps uniconsProps = widget.icon.uniconsProps!;

        uniconsProps.color = Payment.paid == widget.payment
            ? ThemeSAKS.colors.utility.conservative
            : ThemeSAKS.colors.primary.sea;
        ;
        uniconsProps.size = size;

        return IconProps(variant: iconVariant, uniconsProps: uniconsProps);
      case IconVariant.custom:
        final CustomIconsProps customIconsProps = widget.icon.customIconsProps!;

        customIconsProps.color = Payment.paid == widget.payment
            ? ThemeSAKS.colors.utility.conservative
            : ThemeSAKS.colors.primary.sea;
        ;
        customIconsProps.size = size;

        return IconProps(
          variant: iconVariant,
          customIconsProps: customIconsProps,
        );
    }
  }

  Widget _buildIcon() => Icon(props: iconProps);

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
        SizedBox(
          height: AppSize(context: Get.context).getHeight(7),
        ),
        CustomTypography(
          variant: TypographyVariant.h6,
          weight: FontWeight.bold,
          text: widget.name,
          color: ThemeSAKS.colors.primary.sea,
        ),
        SizedBox(
          height: AppSize(context: Get.context).getHeight(7),
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
        SizedBox(
          height: AppSize(context: Get.context).getHeight(21),
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          weight: FontWeight.bold,
          text: widget.valueBonus,
          color: ThemeSAKS.colors.primary.sea,
        ),
        SizedBox(
          height: AppSize(context: Get.context).getHeight(7),
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
        SizedBox(
          height: AppSize(context: Get.context).getHeight(10),
        ),
        Box(
          mix: style,
          child: VBox(children: [
            _textWithIcon(),
            ...widget.dataLabel
                .sublist(1)
                .asMap()
                .entries
                .map((index) => _textWithIconList(index.key + 1))
                .toList()
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
        _buildFirstTextExtended(),
      ],
    );
  }

  Widget _buildFirstTextExtended() {
    final style = Mix(
      crossAxis(CrossAxisAlignment.start),
    );

    return VBox(
      mix: style,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          weight: FontWeight.bold,
          text: widget.dataLabel.first.label,
          color: ThemeSAKS.colors.primary.sea,
        ),
        SizedBox(
          height: AppSize(context: Get.context).getHeight(5),
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: widget.dataLabel.first.data!,
          color: ThemeSAKS.colors.primary.sea,
        ),
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
          if (widget.dataLabel[index].data == null) ...[
            _buildCircleIcon(),
          ] else ...[
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
      opacity(widget.dataLabel[index].data == null ? 0.5 : 1),
    );

    return VBox(
      mix: style,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          weight: FontWeight.bold,
          text: widget.dataLabel[index].label,
          color: ThemeSAKS.colors.primary.sea,
        ),
        SizedBox(
          height: AppSize(context: Get.context).getHeight(5),
        ),
        CustomTypography(
          mix: styleText,
          variant: TypographyVariant.h7,
          text: widget.dataLabel[index].data == null
              ? Constants.hyphen
              : widget.dataLabel[index].data!,
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
            SizedBox(
              height: AppSize(context: Get.context).getHeight(10),
            ),
            _buildCircle(index),
            SizedBox(
              height: AppSize(context: Get.context).getHeight(10),
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
      opacity(widget.dataLabel[index].data == null ? 0.2 : 1),
      height(4),
      width(4),
      bgColor(widget.dataLabel[index].data == null
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
