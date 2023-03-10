import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/util_functions.dart";
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

  static const Key tagFeedbackKey = Key("tagFeedbackKey");
  static const Key containerKey = Key("containerKey");

  @override
  State<ReferralButton> createState() => _ReferralButtonState();
}

class _ReferralButtonState extends State<ReferralButton> {
  bool copied = false;

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      bgColor(NewThemeSAKS.colors.primary.saks),
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
            key: ReferralButton.containerKey,
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
                      color: NewThemeSAKS.colors.primary.sky,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h6,
                      text: shortLink(widget.linkToCopy),
                      color: NewThemeSAKS.colors.primary.sky,
                    )
                  ],
                ),
                Icon(
                  props: IconProps(
                    variant: IconVariant.heroicons,
                    heroIconsProps: HeroIconsProps(
                      icon: HeroIcons.clipboardDocument,
                      color: NewThemeSAKS.colors.primary.sky,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          _buildTagFeedback(),
        ],
      ),
    );
  }

  Widget _buildTagFeedback() {
    final style = Mix(
      bgColor(NewThemeSAKS.colors.utility.conservative),
      px(24),
      py(7),
      rounded(ThemeSAKS.shape.borderRadius),
      opacity(copied ? 1 : 0),
      animated(),
    );

    return Positioned(
      right: 20,
      top: 0,
      child: Box(
        key: ReferralButton.tagFeedbackKey,
        mix: style,
        child: CustomTypography(
          text: widget.feedbackOnCopy,
          variant: TypographyVariant.h6,
          color: NewThemeSAKS.colors.primary.sky,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
