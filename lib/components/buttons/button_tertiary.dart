import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/app_size.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:get/get.dart";
import "package:mix/mix.dart";

class ColorAttributesButton {
  final Color bgColor;
  final Color pressColor;

  ColorAttributesButton({required this.bgColor, required this.pressColor});
}

/// ```dart
/// final button =  ButtonTertiary(
///   text: 'Button',
///  onPressed: () {}
///  );
/// ```
@docWidget
class ButtonTertiary extends StatefulWidget {
  final String text;
  final bool underline;
  final bool strikethrough;

  final IconProps? leftIcon;
  final IconProps? rightIcon;

  final bool disable;
  final void Function()? onPressed;

  final ColorAttributesButton? colorAttributes;

  const ButtonTertiary({
    super.key,
    required this.text,
    this.onPressed,
    this.colorAttributes,
    this.leftIcon,
    this.rightIcon,
    this.disable = false,
    this.underline = false,
    this.strikethrough = false,
  })  : assert(!(leftIcon != null && rightIcon != null),
            "only direction can be used"),
        assert(!(underline == true && strikethrough == true),
            "only font style type can be used");

  @override
  State<ButtonTertiary> createState() => _ButtonTertiaryState();
}

class _ButtonTertiaryState extends State<ButtonTertiary> {
  final defaultColorAttribures = ColorAttributesButton(
      bgColor: ThemeSAKS.colors.primary.saks,
      pressColor: ThemeSAKS.colors.secondary.bay);

  Color? currentColor;

  Color get _pressUpColor {
    return widget.colorAttributes?.bgColor ?? defaultColorAttribures.bgColor;
  }

  Color get _pressDownColor {
    return widget.colorAttributes?.pressColor ??
        defaultColorAttribures.pressColor;
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      currentColor =
          widget.colorAttributes?.bgColor ?? defaultColorAttribures.bgColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapUp: (_) {
        if (widget.onPressed != null && widget.disable == false) {
          setState(() {
            currentColor = _pressUpColor;
          });
          widget.onPressed?.call();
        }

        return;
      },
      onTapCancel: () {
        if (widget.onPressed != null && widget.disable == false) {
          setState(() {
            currentColor = _pressDownColor;
          });
        }
      },
      onTapDown: (_) {
        if (widget.onPressed != null && widget.disable == false) {
          setState(() {
            currentColor = _pressDownColor;
          });
        }
      },
      child: Opacity(
        opacity: widget.disable == true ? 0.5 : 1,
        child: HBox(children: [
          if (widget.leftIcon != null) ...[
            _buildLeftIcon(),
            const SizedBox(
              width: 11,
            ),
          ],
          _buildLabel(),
          if (widget.rightIcon != null) ...[
            const SizedBox(
              width: 11,
            ),
            _buildRightIcon()
          ]
        ]),
      ),
    );
  }

  Widget _buildLabel() {
    TypographyVariant variant = TypographyVariant.h5;

    if (widget.underline == true) {
      variant = TypographyVariant.underline;
    }

    if (widget.strikethrough == true) {
      variant = TypographyVariant.strikethrough;
    }

    return CustomTypography(
      weight: FontWeight.w700,
      variant: variant,
      color: currentColor!,
      text: widget.text,
    );
  }

  Widget _buildLeftIcon() {
    if (widget.leftIcon?.variant == IconVariant.heroicons) {
      widget.leftIcon?.heroIconsProps?.color = currentColor;
      widget.leftIcon?.heroIconsProps?.size =
          AppSize(context: Get.context).getHeight(12);
    }

    if (widget.leftIcon?.variant == IconVariant.unicons) {
      widget.leftIcon?.uniconsProps?.color = currentColor;
      widget.leftIcon?.uniconsProps?.size =
          AppSize(context: Get.context).getHeight(12);
    }

    return Icon(
      props: widget.leftIcon!,
    );
  }

  Widget _buildRightIcon() {
    if (widget.rightIcon?.variant == IconVariant.heroicons) {
      widget.rightIcon?.heroIconsProps?.color = currentColor;
      widget.rightIcon?.heroIconsProps?.size =
          AppSize(context: Get.context).getHeight(12);
    }

    if (widget.rightIcon?.variant == IconVariant.unicons) {
      widget.rightIcon?.uniconsProps?.color = currentColor;
      widget.rightIcon?.uniconsProps?.size =
          AppSize(context: Get.context).getHeight(12);
    }

    return Icon(
      props: widget.rightIcon!,
    );
  }
}
