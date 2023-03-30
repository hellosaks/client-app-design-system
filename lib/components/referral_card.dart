import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/cards/lib/components/custom_divider.dart";
import "package:client_app_design_system/utils/app_size.dart";
import "package:client_app_design_system/utils/constants.dart";
import "package:client_app_design_system/utils/data_label.dart";
import "package:client_app_design_system/utils/util_functions.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:get/get.dart";
import "package:mix/mix.dart";

@docWidget
class ReferralCard extends StatefulWidget {
  final ReferralPaymentType payment;
  final String textBonus;
  final String name;
  final String valueBonus;
  final IconProps icon;
  final String textPaid;
  final String dateCard;
  final List<DataLabel> dataLabel;
  final void Function()? onPressed;

  const ReferralCard({
    super.key,
    required this.payment,
    required this.textBonus,
    required this.name,
    required this.dateCard,
    required this.valueBonus,
    required this.dataLabel,
    required this.icon,
    required this.textPaid,
    this.onPressed,
  });

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

  @override
  Widget build(BuildContext context) {
    final box = Mix(
      bgColor(
        widget.payment == ReferralPaymentType.paid
            ? ThemeSAKS.colors.special.leaf
            : ThemeSAKS.colors.primary.sky,
      ),
      rounded(ThemeSAKS.shape.borderRadiusCard),
      width(double.infinity),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
          _expanded ? _controller.forward() : _controller.reverse();
        });
        final pressed = widget.onPressed;
        pressed!();
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
      ),
    );
  }

  Widget _buildClosedCardInfo() {
    final style = Mix(
      pt(10),
      pl(26),
      pr(20),
      pb(14),
      crossAxis(CrossAxisAlignment.end),
      mainAxis(MainAxisAlignment.spaceBetween),
    );
    return HBox(
      mix: style,
      children: [
        _buildIconWithTexts(),
        _buildVertical2Texts(),
      ],
    );
  }

  Widget _buildIconWithTexts() {
    return HBox(
      children: [
        _buildIcon(),
        const SizedBox(
          width: 24,
        ),
        _buildTexts(),
      ],
    );
  }

  Widget _buildIcon() => Icon(
        props: iconProps(
          props: widget.icon,
          variant: IconVariant.unicons,
          color: widget.payment == ReferralPaymentType.paid
              ? ThemeSAKS.colors.utility.conservative
              : ThemeSAKS.colors.primary.sea,
          size: 30,
        ),
      );

  Widget _buildTexts() {
    final style = Mix(crossAxis(CrossAxisAlignment.start));
    final styleTypo = Mix(opacity(0.5));

    return VBox(
      mix: style,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          text: widget.textBonus,
          weight: FontWeight.w600,
          color: ThemeSAKS.colors.primary.sea.withOpacity(0.5),
          mix: styleTypo,
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
          mix: widget.payment == ReferralPaymentType.paid ? null : styleTypo,
          weight: FontWeight.w600,
          color: widget.payment == ReferralPaymentType.paid
              ? ThemeSAKS.colors.utility.conservative
              : ThemeSAKS.colors.primary.sea.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _buildVertical2Texts() {
    final style = Mix(
      opacity(1),
    );

    final styleVbox = Mix(
      crossAxis(CrossAxisAlignment.end),
    );

    return VBox(
      mix: styleVbox,
      children: [
        CustomTypography(
          variant: TypographyVariant.h6,
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
          weight: FontWeight.w600,
          mix: style,
          color: ThemeSAKS.colors.primary.sea.withOpacity(0.5),
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
      child: VBox(
        children: [
          const CustomDivider(),
          SizedBox(
            height: AppSize(context: Get.context).getHeight(10),
          ),
          Box(
            mix: style,
            child: VBox(
              children: [
                _textWithIcon(),
                ...widget.dataLabel.sublist(1).map(
                      (index) => _textWithIconList(
                        index.data,
                        index.label,
                      ),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _textWithIcon() {
    return HBox(
      // mix: style,
      children: [
        const SizedBox(
          width: 25,
        ),
        Icon(
          props: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(
              icon: UniconsSolid.check_circle,
              color: ThemeSAKS.colors.utility.conservative,
              size: 24,
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        _textExtended(
          widget.dataLabel.first.data,
          widget.dataLabel.first.label,
        ),
      ],
    );
  }

  Widget _buildCheckCircle() {
    return Icon(
      props: IconProps(
        variant: IconVariant.unicons,
        uniconsProps: UniconsProps(
          icon: UniconsSolid.check_circle,
          color: ThemeSAKS.colors.utility.conservative,
          size: 24,
        ),
      ),
    );
  }

  Widget _textWithIconList(String? data, String label) {
    final style = Mix(
      pl(25),
    );
    return VBox(
      children: [
        _buildVerticalCircles(data),
        HBox(
          mix: style,
          children: [
            if (data == null) _buildCircleIcon() else _buildCheckCircle(),
            const SizedBox(
              width: 24,
            ),
            _textExtended(data, label),
          ],
        ),
      ],
    );
  }

  Widget _textExtended(String? data, String label) {
    final style = Mix(
      crossAxis(CrossAxisAlignment.start),
    );

    return VBox(
      mix: style,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          weight: FontWeight.bold,
          text: label,
          color: ThemeSAKS.colors.primary.sea,
        ),
        SizedBox(
          height: AppSize(context: Get.context).getHeight(5),
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: data ?? Constants.hyphen,
          color: ThemeSAKS.colors.primary.sea.withOpacity(0.5),
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

  Widget _buildVerticalCircles(String? data) {
    final circle = _buildCircle(data);
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
            circle,
            SizedBox(
              height: AppSize(context: Get.context).getHeight(10),
            ),
            circle,
            SizedBox(
              height: AppSize(context: Get.context).getHeight(10),
            ),
            circle,
          ],
        )
      ],
    );
  }

  Widget _buildCircle(String? data) {
    final style = Mix(
      crossAxis(CrossAxisAlignment.end),
      opacity(data == null ? 0.2 : 1),
      height(4),
      width(4),
      bgColor(
        data == null
            ? ThemeSAKS.colors.primary.sea
            : ThemeSAKS.colors.utility.conservative,
      ),
      rounded(ThemeSAKS.shape.borderRadius),
    );

    return Box(
      mix: style,
      child: const Center(),
    );
  }
}
