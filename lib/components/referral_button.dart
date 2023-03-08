import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

@docWidget
class ReferralButton extends StatefulWidget {
  final Function(String) onCopy;
  final String linkToCopy;
  final String title;
  final String feedbackOnCopy;

  const ReferralButton({
    super.key,
    required this.title,
    required this.onCopy,
    required this.linkToCopy,
    required this.feedbackOnCopy,
  });

  @override
  State<ReferralButton> createState() => _ReferralButtonState();
}

class _ReferralButtonState extends State<ReferralButton> {
  bool copied = false;
  String _shorLink() {
    final link = widget.linkToCopy.replaceAll("https://", "");
    final firstShorLink = link.substring(0, 10);
    final secondShorLink = link.substring(link.length - 10, link.length);

    return "$firstShorLink...$secondShorLink";
  }

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      bgColor(ThemeSAKS.colors.primary.saks),
      px(30),
      py(20),
      mt(15),
      rounded(ThemeSAKS.shape.borderRadiusCard),
    );
    final styleVBox = Mix(crossAxis(CrossAxisAlignment.start));
    final styleHbox = Mix(mainAxis(MainAxisAlignment.spaceBetween));

    return Pressable(
      onPressed: () {
        widget.onCopy(widget.linkToCopy);
        setState(() => copied = true);
        Future.delayed(const Duration(seconds: 2)).then((value) {
          setState(() => copied = false);
        });
      },
      child: Stack(
        children: [
          Box(
            mix: style,
            child: HBox(
              mix: styleHbox,
              children: [
                VBox(
                  mix: styleVBox,
                  children: [
                    CustomTypography(
                      variant: TypographyVariant.h4,
                      text: widget.title,
                      color: ThemeSAKS.colors.primary.sky,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h6,
                      text: _shorLink(),
                      color: ThemeSAKS.colors.primary.sky,
                    )
                  ],
                ),
                Icon(
                  props: IconProps(
                    variant: IconVariant.heroicons,
                    heroIconsProps: HeroIconsProps(
                      icon: HeroIcons.clipboardDocument,
                      color: ThemeSAKS.colors.primary.sky,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            child: Box(
              mix: Mix(
                bgColor(ThemeSAKS.colors.utility.conservative),
                px(24),
                py(7),
                rounded(ThemeSAKS.shape.borderRadius),
                opacity(copied ? 1 : 0),
                animated(),
              ),
              child: CustomTypography(
                text: widget.feedbackOnCopy,
                variant: TypographyVariant.h6,
                color: ThemeSAKS.colors.primary.sky,
                weight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
