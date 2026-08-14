import "package:cached_network_image/cached_network_image.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:material_ui/material_ui.dart";
import "package:flutter_blurhash/flutter_blurhash.dart";

@docWidget
class CardBanner extends StatelessWidget {
  final String backgroundImage;
  final void Function()? onPressed;

  /// add title bellow image
  final String? title;

  /// show button to call action
  final String? buttonLabel;

  /// used when loading image
  final String? blurHash;

  /// used when loading image to show skeleton or blurhash
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
    return GestureDetector(
      onTap: onPressed,
      child: title == null
          ? _buildBackgroundImage(context)
          : _buildBackgroundImageWithTitle(context),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.all(Radius.circular(ThemeSAKS.shape.borderRadiusCard)),
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
    return ClipRRect(
      borderRadius:
          BorderRadius.all(Radius.circular(ThemeSAKS.shape.borderRadiusCard)),
      child: ColoredBox(
        color: ThemeSAKS.colors.primary.sky,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: backgroundImage,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return _loadingImage(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTypography(
                    variant: TypographyVariant.h6,
                    text: title!,
                    weight: FontWeight.w700,
                    color: ThemeSAKS.colors.primary.sea,
                  ),
                  if (buttonLabel != null)
                    AuxiliarButton(label: buttonLabel!, onPressed: onPressed!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loadingImage(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio,
        // TODO add here the skeleton
        child: blurHash != null ? BlurHash(hash: blurHash!) : const SizedBox()
        // : const SkeletonAvatar(
        //     style:
        //         SkeletonAvatarStyle(width: double.infinity, minHeight: 100),
        //   ),
        );
  }
}
