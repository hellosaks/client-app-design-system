import "package:client_app_design_system/theme/theme_saks.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:flutter/widgets.dart";
import "package:mix/mix.dart";

class CardBanner extends StatelessWidget {
  final String backgroundImage;
  final CardBannerType actionType;
  final void Function() onPressed;
  final String? title;
  final String? buttonLabel;

  const CardBanner({
    super.key,
    required this.backgroundImage,
    required this.actionType,
    required this.onPressed,
    this.buttonLabel,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onPressed,
      child: _buildBackgroundImage(),
    );
  }

  Widget _buildBackgroundImage() {
    return ClipRRect(
      borderRadius:
          BorderRadius.all(Radius.circular(ThemeSAKS.shape.borderRadius)),
      // child: CachedNetworkImage(
      //   imageUrl: backgroundImage,
      //   fit: BoxFit.fill,
      //   height: height,
      // ),
    );
  }
}
