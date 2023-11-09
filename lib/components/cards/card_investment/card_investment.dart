import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/profitability_type_enum.dart";
import "package:client_app_design_system/utils/enums/risk_type_enum.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

@docWidget
class CardInvestment extends StatelessWidget {
  final String name;
  final String typeName;
  final RiskType riskType;
  final String riskTypeName;

  final String profitabilityName;
  final String profitabilityValue;
  final ProfitabilityIndicator profitabilityIndicator;

  final bool showArrow;
  final String? urlImage;
  final void Function()? onPressed;

  const CardInvestment({
    super.key,
    required this.name,
    required this.typeName,
    required this.riskType,
    required this.riskTypeName,
    required this.profitabilityName,
    required this.profitabilityValue,
    required this.profitabilityIndicator,
    this.showArrow = false,
    this.urlImage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ThemeSAKS.shape.borderRadiusCard),
      child: Material(
        color: ThemeSAKS.colors.secondary.cards,
        child: InkWell(
          splashColor: ThemeSAKS.colors.secondary.cards,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildFirstRow(),
                const SizedBox(height: 21),
                _buildSecondRow()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstRow() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: CustomTypography(
            variant: TypographyVariant.h6,
            text: name,
            weight: FontWeight.w600,
          ),
        ),
        if (urlImage != null) ...[
          const Spacer(),
          Image.network(
            urlImage!,
            width: 74,
            height: 30,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return child;
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Skeleton(width: 74, height: 30, radius: 40);
            },
          )
        ] else
          const SizedBox()
      ],
    );
  }

  Widget _buildSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRiskType(),
        _buildProfitability(),
        if (showArrow) _buildArrow() else const SizedBox()
      ],
    );
  }

  Widget _buildRiskType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTypography(
          variant: TypographyVariant.h6,
          text: typeName,
          weight: FontWeight.w500,
          color: ThemeSAKS.colors.grayscale.strongGrey,
        ),
        CustomTypography(
          variant: TypographyVariant.h6,
          text: riskTypeName,
          weight: FontWeight.w500,
          color: colorForRiskType,
        )
      ],
    );
  }

  Widget _buildProfitability() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTypography(
          variant: TypographyVariant.h6,
          text: profitabilityName,
          weight: FontWeight.w500,
          color: ThemeSAKS.colors.grayscale.strongGrey,
        ),
        Row(
          children: [
            iconForProfitabilityIndicator,
            const SizedBox(width: 5),
            CustomTypography(
              variant: TypographyVariant.h6,
              text: profitabilityValue,
              weight: FontWeight.w500,
              color: colorForProfitabilityIndicator,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildArrow() {
    return Icon(
      props: IconProps(
        variant: IconVariant.unicons,
        uniconsProps: UniconsProps(
          icon: UniconsLine.arrow_circle_right,
          color: ThemeSAKS.colors.primary.sea,
        ),
      ),
    );
  }

  @visibleForTesting
  Widget get iconForProfitabilityIndicator {
    switch (profitabilityIndicator) {
      case ProfitabilityIndicator.low:
        return Icon(
          props: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(
              icon: UniconsLine.angle_down,
              color: colorForProfitabilityIndicator,
              // size: 12,
            ),
          ),
        );
      case ProfitabilityIndicator.zero:
        return const SizedBox();
      case ProfitabilityIndicator.high:
        return Icon(
          props: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(
              icon: UniconsLine.angle_up,
              color: colorForProfitabilityIndicator,
              // size: 12,
            ),
          ),
        );
    }
  }

  @visibleForTesting
  Color get colorForProfitabilityIndicator {
    switch (profitabilityIndicator) {
      case ProfitabilityIndicator.low:
        return ThemeSAKS.colors.utility.moderate;
      case ProfitabilityIndicator.zero:
        return ThemeSAKS.colors.grayscale.strongGrey;
      case ProfitabilityIndicator.high:
        return ThemeSAKS.colors.utility.conservative;
    }
  }

  @visibleForTesting
  Color get colorForRiskType {
    switch (riskType) {
      case RiskType.conservative:
        return ThemeSAKS.colors.secondary.bay;
      case RiskType.moderate:
        return ThemeSAKS.colors.utility.moderate;
      case RiskType.aggressive:
        return ThemeSAKS.colors.utility.aggressive;
    }
  }
}
