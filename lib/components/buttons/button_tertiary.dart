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

@docWidget
class ButtonTertiary extends StatefulWidget {
  final String text;
  final bool underline;
  final bool strikethrough;

  final HeroIcons? leftIcon;
  final HeroIcons? rightIcon;

  final bool disable;
  final void Function()? onPressed;

  final ColorAttributesButton? colorAttributes;

  const ButtonTertiary({
    super.key,
    required this.text,
    required this.onPressed,
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
      bgColor: NewThemeSAKS.colors.primary.saks,
      pressColor: NewThemeSAKS.colors.secondary.bay);

  Color? currentColor;
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
            currentColor = widget.colorAttributes?.bgColor ??
                defaultColorAttribures.bgColor;
          });
          widget.onPressed?.call();
        }

        return;
      },
      onTapCancel: () {
        if (widget.onPressed != null && widget.disable == false) {
          setState(() {
            currentColor = widget.colorAttributes?.bgColor ??
                defaultColorAttribures.bgColor;
          });
        }
      },
      onTapDown: (_) {
        if (widget.onPressed != null && widget.disable == false) {
          setState(() {
            currentColor = widget.colorAttributes?.pressColor ??
                defaultColorAttribures.pressColor;
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
    final styles = Mix((widget.underline == false &&
        widget.strikethrough == false)(fontWeight(FontWeight.w700)));

    TypographyVariant variant = TypographyVariant.h5;

    if (widget.underline == true) {
      variant = TypographyVariant.underline;
    }

    if (widget.strikethrough == true) {
      variant = TypographyVariant.strikethrough;
    }

    return CustomTypography(
      mix: styles,
      variant: variant,
      color: currentColor!,
      text: widget.text,
    );
  }

  Widget _buildLeftIcon() {
    return Icon(
      props: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: widget.leftIcon!,
          color: currentColor,
          size: AppSize(context: Get.context).getHeight(12),
        ),
      ),
    );
  }

  Widget _buildRightIcon() {
    return Icon(
      props: IconProps(
        variant: IconVariant.heroicons,
        heroIconsProps: HeroIconsProps(
          icon: widget.rightIcon!,
          color: currentColor,
          size: AppSize(context: Get.context).getHeight(12),
        ),
      ),
    );
  }
}
