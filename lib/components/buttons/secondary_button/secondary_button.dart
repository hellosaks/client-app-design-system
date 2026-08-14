import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart" hide Icon;

@docWidget
class SecondaryButton extends StatefulWidget {
  final String text;
  final IconProps? leftIcon;
  final IconProps? rightIcon;
  final bool disabled;
  final bool selected;
  final bool outlined;
  final void Function() onPressed;
  final ColorAttributesButton? colorAttributes;

  static const Key boxContainerKey = Key("box-container");

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorAttributes,
    this.leftIcon,
    this.rightIcon,
    this.disabled = false,
    this.selected = false,
    this.outlined = false,
  })  : assert(
          !(leftIcon != null && rightIcon != null),
          "only direction can be used",
        ),
        assert(
          !((leftIcon != null || rightIcon != null) && selected == true),
          "selected cannot be used with icon properties",
        ),
        assert(
          !(outlined == true && colorAttributes == null),
          "you need pass color attributes",
        );

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  final defaultColorAttributes = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.primary.saks,
    pressColor: ThemeSAKS.colors.secondary.bay,
  );

  Color? currentColor;
  bool pressed = false;

  Color get _pressUpColor {
    return widget.colorAttributes?.bgColor ?? defaultColorAttributes.bgColor;
  }

  Color get _pressDownColor {
    return widget.colorAttributes?.pressColor ??
        defaultColorAttributes.pressColor;
  }

  Color get _insideColor {
    return widget.colorAttributes?.insideColor ??
        defaultColorAttributes.insideColor;
  }

  @override
  void initState() {
    super.initState();
    currentColor =
        widget.colorAttributes?.bgColor ?? defaultColorAttributes.bgColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapUp: (_) {
        if (!widget.disabled) {
          setState(() {
            currentColor = _pressUpColor;
            pressed = false;
          });
          widget.onPressed.call();
        }
      },
      onTapCancel: () {
        if (!widget.disabled) {
          setState(() {
            currentColor = _pressUpColor;
            pressed = false;
          });
        }
      },
      onTapDown: (_) {
        if (!widget.disabled) {
          setState(() {
            currentColor = _pressDownColor;
            pressed = true;
          });
        }
      },
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    final borderRadius = BorderRadius.circular(ThemeSAKS.shape.borderRadius);
    final paddingVertical =
        (widget.leftIcon != null || widget.rightIcon != null || widget.selected)
            ? 6.0
            : 9.0;

    return Container(
      key: SecondaryButton.boxContainerKey,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.outlined ? Colors.transparent : currentColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: widget.outlined
              ? (widget.colorAttributes?.borderColor ??
                  ThemeSAKS.colors.grayscale.division)
              : currentColor!,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: paddingVertical),
      child: Opacity(
        opacity: widget.disabled ? 0.5 : 1,
        child: CoreButton(
          leftIcon: widget.leftIcon,
          rightIcon: widget.rightIcon,
          text: widget.text,
          checked: widget.selected,
          color: _color,
        ),
      ),
    );
  }

  Color get _color {
    if (widget.outlined && pressed) {
      return _pressDownColor;
    }
    return _insideColor;
  }
}
