import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

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
    return GestureDetector(
      onTap: () {
        widget.onCopy(widget.linkToCopy);
        setState(() => copied = true);
        Future.delayed(const Duration(seconds: 2)).then((value) {
          setState(() => copied = false);
        });
      },
      child: Stack(
        children: [
          Container(
            key: ReferralButton.containerKey,
            margin: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              color: ThemeSAKS.colors.primary.saks,
              borderRadius: BorderRadius.all(
                  Radius.circular(ThemeSAKS.shape.borderRadiusCard)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTypography(
                      variant: TypographyVariant.h4,
                      text: widget.title,
                      color: ThemeSAKS.colors.primary.sky,
                    ),
                    CustomTypography(
                      variant: TypographyVariant.h6,
                      text: shortLink(widget.linkToCopy),
                      color: ThemeSAKS.colors.primary.sky,
                    )
                  ],
                ),
                Icon(
                  props: IconProps(
                    variant: IconVariant.unicons,
                    uniconsProps: UniconsProps(
                      icon: UniconsLine.copy,
                      color: ThemeSAKS.colors.primary.sky,
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
    return Positioned(
      right: 20,
      top: 0,
      child: Opacity(
        opacity: copied ? 1 : 0,
        child: Container(
          key: ReferralButton.tagFeedbackKey,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7),
          decoration: BoxDecoration(
              color: ThemeSAKS.colors.utility.conservative,
              borderRadius:
                  BorderRadius.circular(ThemeSAKS.shape.borderRadius)),
          child: CustomTypography(
            text: widget.feedbackOnCopy,
            variant: TypographyVariant.h6,
            color: ThemeSAKS.colors.primary.sky,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
