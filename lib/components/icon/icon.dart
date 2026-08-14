import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart" as material_icon show Icon;
import "package:material_ui/material_ui.dart" hide Icon;
import "package:flutter_svg/flutter_svg.dart";
import "package:path/path.dart" as p;

class UniconsProps {
  /// use [UniconsLine] or [UniconsSolid] to display icon using unicons library.
  IconData icon;
  Color? color;
  double? size;

  UniconsProps({required this.icon, this.color, this.size});
}

class CustomIconsProps {
  CustomIcons icon;
  Color? color;
  double? size;

  CustomIconsProps({required this.icon, this.color, this.size});
}

class IconProps {
  final IconVariant variant;
  final UniconsProps? uniconsProps;
  final CustomIconsProps? customIconsProps;

  IconProps({
    required this.variant,
    this.uniconsProps,
    this.customIconsProps,
  })  : assert(
          !(variant == IconVariant.unicons && uniconsProps == null),
          "unicons needs to have uniconsProps",
        ),
        assert(
          !(variant == IconVariant.custom && customIconsProps == null),
          "custom variant needs to have customIconsProps",
        );

  IconProps copyWith({
    Color? color,
    double? size,
  }) {
    switch (variant) {
      case IconVariant.unicons:
        uniconsProps!.color = color ?? uniconsProps?.color;
        uniconsProps!.size = size ?? uniconsProps?.size;

        return IconProps(variant: variant, uniconsProps: uniconsProps);
      case IconVariant.custom:
        customIconsProps!.color = color ?? customIconsProps?.color;
        customIconsProps!.size = size ?? customIconsProps?.size;

        return IconProps(
          variant: variant,
          customIconsProps: customIconsProps,
        );
    }
  }
}

/// ```dart
/// final icon = Icon(
///   props: IconProps(
///     variant: IconVariant.heroicons,
///     heroIconsProps: HeroIconsProps(
///       icon: HeroIcons.academicCap,
///       color: ThemeSAKS.colors.primary.sea,
///       size: 40,
///     ),
///   ),
/// );
/// ```
@docWidget
class Icon extends StatelessWidget {
  final IconProps props;

  const Icon({super.key, required this.props});

  @override
  Widget build(BuildContext context) {
    switch (props.variant) {
      case IconVariant.unicons:
        return material_icon.Icon(
          props.uniconsProps!.icon,
          size: props.uniconsProps!.size,
          color: props.uniconsProps!.color,
        );
      case IconVariant.custom:
        final iconPath = p.join(
          "packages/client_app_design_system/assets/icons/",
          "${props.customIconsProps!.icon.name}.svg",
        );

        return SvgPicture.asset(
          iconPath,
          color: props.customIconsProps?.color,
          width: props.customIconsProps?.size,
          height: props.customIconsProps?.size,
        );
    }
  }
}
