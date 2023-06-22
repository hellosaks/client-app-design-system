import "package:client_app_design_system/client_app_design_system.dart";
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
};
