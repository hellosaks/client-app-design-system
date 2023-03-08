import "package:client_app_design_system/utils/enums.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" as material_icon show Icon;
import "package:flutter/material.dart" hide Icon;
import "package:heroicons/heroicons.dart";
import "package:unicons/unicons.dart";

class HeroIconsProps {
  HeroIcons icon;
  Color? color;
  double? size;
  HeroIconStyle? style;

  HeroIconsProps({required this.icon, this.color, this.size, this.style});
}

class UniconsProps {
  /// use [UniconsLine] or [UniconsSolid] to display icon using unicons library.
  IconData icon;
  Color? color;
  double? size;

  UniconsProps({required this.icon, this.color, this.size});
}

class IconProps {
  final IconVariant variant;
  final HeroIconsProps? heroIconsProps;
  final UniconsProps? uniconsProps;

  IconProps({required this.variant, this.heroIconsProps, this.uniconsProps})
      : assert(!(variant == IconVariant.heroicons && heroIconsProps == null),
            "heroicons needs to have heroIconsProps"),
        assert(!(variant == IconVariant.unicons && uniconsProps == null),
            "unicons needs to have uniconsProps");
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
      case IconVariant.heroicons:
        return HeroIcon(
          props.heroIconsProps!.icon,
          style: props.heroIconsProps!.style,
          color: props.heroIconsProps!.color,
          size: props.heroIconsProps!.size,
        );
      case IconVariant.unicons:
        return material_icon.Icon(
          props.uniconsProps!.icon,
          size: props.uniconsProps!.size,
          color: props.uniconsProps!.color,
        );
    }
  }
}
