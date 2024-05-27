import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart' hide Icon;

@docWidget
class IndicationFilters extends StatelessWidget {
  final String text;
  final int number;
  final Filter filter;
  final bool isSelected;
  final void Function() onPressed;

  const IndicationFilters({
    super.key,
    required this.text,
    required this.filter,
    required this.number,
    required this.onPressed,
    this.isSelected = false,
  });

  static const ValueKey circleKey = ValueKey("circleKey");
  static const ValueKey vboxKey = ValueKey("vboxKey");
  static const ValueKey pressableKey = ValueKey("pressableKey");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: IndicationFilters.pressableKey,
      onTap: onPressed,
      child: Container(
        width: 155,
        decoration: BoxDecoration(
          color: filter == Filter.activated
              ? ThemeSAKS.colors.special.leaf
              : ThemeSAKS.colors.primary.sky,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          key: IndicationFilters.vboxKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? ThemeSAKS.colors.primary.sea.withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildCircle(),
                      _buildArrow(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return CustomTypography(
      text: text,
      variant: TypographyVariant.h4,
      weight: FontWeight.bold,
      color: ThemeSAKS.colors.primary.sea,
    );
  }

  Widget _buildCircle() {
    return Container(
      key: IndicationFilters.circleKey,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: filter == Filter.activated
            ? ThemeSAKS.colors.utility.conservative
            : ThemeSAKS.colors.primary.sea,
        borderRadius: BorderRadius.circular(ThemeSAKS.shape.borderRadius),
      ),
      child: Center(
        child: CustomTypography(
          text: number.toString(),
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
        variant: IconVariant.unicons,
        uniconsProps: UniconsProps(
          icon: UniconsLine.arrow_circle_right,
          color: ThemeSAKS.colors.primary.sea,
          size: 24,
        ),
      ),
    );
  }
}
