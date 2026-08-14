import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:get/get.dart";
import "package:material_ui/material_ui.dart" hide Icon;

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
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
          _expanded ? _controller.forward() : _controller.reverse();
        });

        if (widget.onPressed != null) {
          widget.onPressed!.call();
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeSAKS.shape.borderRadiusCard),
          color: widget.payment == ReferralPaymentType.paid
              ? ThemeSAKS.colors.special.leaf
              : ThemeSAKS.colors.primary.sky,
        ),
        key: ReferralCard.cardKey,
        child: Column(
          children: [
            _buildClosedCardInfo(),
            _buildExtendedCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildClosedCardInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 10, 20, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconWithTexts(),
          _buildVertical2Texts(),
        ],
      ),
    );
  }

  Widget _buildIconWithTexts() {
    return Row(
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
        props: widget.icon.copyWith(
          color: widget.payment == ReferralPaymentType.paid
              ? ThemeSAKS.colors.utility.conservative
              : ThemeSAKS.colors.primary.sea,
          size: 30,
        ),
      );

  Widget _buildTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTypography(
          variant: TypographyVariant.h7,
          text: widget.textBonus,
          weight: FontWeight.w600,
          color: ThemeSAKS.colors.primary.sea.withOpacity(0.5),
        ),
        SizedBox(
          height: AppSize(context: Get.context).getHeight(7),
        ),
        SizedBox(
          width: 130,
          child: CustomTypography(
            variant: TypographyVariant.h6,
            weight: FontWeight.bold,
            text: widget.name,
            color: ThemeSAKS.colors.primary.sea,
          ),
        ),
        SizedBox(
          height: AppSize(context: Get.context).getHeight(7),
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: widget.textPaid,
          weight: FontWeight.w600,
          color: widget.payment == ReferralPaymentType.paid
              ? ThemeSAKS.colors.utility.conservative
              : ThemeSAKS.colors.primary.sea.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _buildVertical2Texts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
          color: ThemeSAKS.colors.primary.sea.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _buildExtendedCard() {
    return SizeTransition(
      sizeFactor: _animation,
      child: Column(
        children: [
          const CustomDivider(),
          SizedBox(
            height: AppSize(context: Get.context).getHeight(10),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: Column(
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
    return Row(
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
    return Column(
      children: [
        _buildVerticalCircles(data),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              if (data == null) _buildCircleIcon() else _buildCheckCircle(),
              const SizedBox(
                width: 24,
              ),
              _textExtended(data, label),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textExtended(String? data, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    return SizedBox(
      height: 24,
      width: 24,
      child: Container(
        height: 19.5,
        width: 19.5,
        decoration: BoxDecoration(
            color: ThemeSAKS.colors.primary.sea.withOpacity(0.2),
            borderRadius: BorderRadius.circular(ThemeSAKS.shape.borderRadius),),
        child: const Center(),
      ),
    );
  }

  Widget _buildVerticalCircles(String? data) {
    final circle = _buildCircle(data);
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Row(
        key: ReferralCard.circleKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
      ),
    );
  }

  Widget _buildCircle(String? data) {
    return Container(
      height: 4,
      width: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeSAKS.shape.borderRadius),
        color: data == null
            ? ThemeSAKS.colors.primary.sea.withOpacity(0.2)
            : ThemeSAKS.colors.utility.conservative,
      ),
      child: const Center(),
    );
  }
}
