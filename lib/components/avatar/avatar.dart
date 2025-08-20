import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

@docWidget
class Avatar extends StatelessWidget {
  final double? radius;
  final String? imageUrl;

  final void Function() onPressed;
  static String containerKey = "avatar";
  const Avatar({
    required this.onPressed,
    this.radius,
    this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        key: ValueKey(Avatar.containerKey),
        backgroundColor: ThemeSAKS.colors.secondary.ice,
        radius: radius ?? 25,
        backgroundImage: imageUrl != null
            ? NetworkImage(
                imageUrl!,
              )
            : null, // backgroundImage: NetworkImage
        child: imageUrl == null ? _buildIcon() : null,
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      props: IconProps(
        variant: IconVariant.custom,
        customIconsProps: CustomIconsProps(
          icon: CustomIcons.icProfileIcon,
          size: 24,
        ),
      ),
    );
  }
}
