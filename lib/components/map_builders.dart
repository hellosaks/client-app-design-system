import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/chart_distribution/dto/chart_distribution_builder.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

typedef BuilderConstructorWidget<T extends JsonWidgetBuilder> = T Function(
  Map<dynamic, dynamic> json, {
  JsonWidgetRegistry? registry,
});

/// Map with all builders implemented in design system
final Map<String, BuilderConstructorWidget> mapBuilders = {
  AvatarBuilder.type: AvatarBuilder.fromDynamic,
  IconBuilder.type: IconBuilder.fromDynamic,
  SkeletonBuilder.type: SkeletonBuilder.fromDynamic,
  CardBannerBuilder.type: CardBannerBuilder.fromDynamic,
  SvgBuilder.type: SvgBuilder.fromDynamic,
  CustomDividerBuilder.type: CustomDividerBuilder.fromDynamic,
  NotificationBellBuilder.type: NotificationBellBuilder.fromDynamic,
  CommonModalBuilder.type: CommonModalBuilder.fromDynamic,
  CustomTypographyBuilder.type: CustomTypographyBuilder.fromDynamic,
  SecondaryButtonBuilder.type: SecondaryButtonBuilder.fromDynamic,
  CircularChartDistributionBuilder.type:
      CircularChartDistributionBuilder.fromDynamic,
  CustomAccordionBuilder.type: CustomAccordionBuilder.fromDynamic,
  CustomLineChartBuilder.type: CustomLineChartBuilder.fromDynamic,
};
