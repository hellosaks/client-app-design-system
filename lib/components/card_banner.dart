import "package:cached_network_image/cached_network_image.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_blurhash/flutter_blurhash.dart";
import "package:mix/mix.dart";
import "package:skeletons/skeletons.dart";

@docWidget
class CardBanner extends StatelessWidget {
  final String backgroundImage;
  final void Function()? onPressed;
  final String? title;
  final String? buttonLabel;
  final String? blurHash;
  final double aspectRatio;

  const CardBanner({
    super.key,
    required this.backgroundImage,
    this.onPressed,
    this.buttonLabel,
    this.title,
    this.blurHash,
    this.aspectRatio = 16 / 5,
  })  : assert(
          !(buttonLabel != null && title == null),
          "buttonLabel needs the title not to be null",
        ),
        assert(
          !(buttonLabel != null && onPressed == null),
          "buttonLabel needs the onPressed not to be null",
        );

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onPressed,
      child: title == null
          ? _buildBackgroundImage(context)
          : _buildBackgroundImageWithTitle(context),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
          Radius.circular(NewThemeSAKS.shape.borderRadiusCard)),
      child: CachedNetworkImage(
        imageUrl: backgroundImage,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, progress) {
          return _loadingImage(context);
        },
      ),
    );
  }

  Widget _buildBackgroundImageWithTitle(BuildContext context) {
    final style = Mix(bgColor(NewThemeSAKS.colors.primary.sky));
    final styleHbox =
        Mix(px(25), py(20), mainAxis(MainAxisAlignment.spaceBetween));

    return ClipRRect(
      borderRadius: BorderRadius.all(
          Radius.circular(NewThemeSAKS.shape.borderRadiusCard)),
      child: VBox(
        mix: style,
        children: [
          CachedNetworkImage(
            imageUrl: backgroundImage,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) {
              return _loadingImage(context);
            },
          ),
          HBox(
            mix: styleHbox,
            children: [
              CustomTypography(
                variant: TypographyVariant.h6,
                text: title!,
                weight: FontWeight.w700,
                color: NewThemeSAKS.colors.primary.sea,
              ),
              if (buttonLabel != null)
                AuxButton(label: buttonLabel!, onPressed: onPressed!),
            ],
          )
        ],
      ),
    );
  }

  Widget _loadingImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: blurHash != null
          ? BlurHash(hash: blurHash!)
          : const SkeletonAvatar(
              style:
                  SkeletonAvatarStyle(width: double.infinity, minHeight: 100),
            ),
    );
  }
}
