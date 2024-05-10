import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart";

class FullScreenNotice extends StatelessWidget {
  final Widget logo;
  final Widget errorWidget;

  final String title;
  final String description;
  final String? buttonText;
  final void Function()? onButtonPressed;

  const FullScreenNotice({
    super.key,
    required this.errorWidget,
    required this.logo,
    required this.title,
    required this.description,
    this.buttonText,
    this.onButtonPressed,
  }) : assert(
          !((buttonText == null && onButtonPressed != null) ||
              (buttonText != null && onButtonPressed == null)),
          "should contain the button properties",
        );

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                logo,
                const SizedBox(height: 64),
                errorWidget,
                const SizedBox(height: 32),
                CustomTypography(
                  variant: TypographyVariant.h2,
                  weight: FontWeight.bold,
                  text: title,
                  align: TextAlign.center,
                  color: ThemeSAKS.colors.primary.sea,
                ),
                const SizedBox(height: 64),
                CustomTypography(
                  align: TextAlign.center,
                  variant: TypographyVariant.h4,
                  text: description,
                  color: ThemeSAKS.colors.primary.sea,
                ),
                const Spacer(),
                if (buttonText != null)
                  PrimaryButton(
                    text: buttonText!,
                    onPressed: onButtonPressed!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
