import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;
import "package:mix/mix.dart";

class NotificationBell extends StatelessWidget {
  final int numberOfNotifications;
  final VoidCallback onPressed;
  final IconProps iconProps;

  static String badgeKey = "notification_bell_badge";
  static String bellKey = "notification_bell";

  const NotificationBell({
    super.key,
    required this.numberOfNotifications,
    required this.onPressed,
    required this.iconProps,
  });

  @override
  Widget build(BuildContext context) {
    final Mix containerStyle = Mix(width(35), height(35));
    return Stack(
      children: [
        IconButton(
          key: Key(NotificationBell.bellKey),
          onPressed: onPressed,
          splashRadius: ThemeSAKS.shape.iconButtonSplashRadius,
          icon: Box(
            mix: containerStyle,
            child: Icon(
              props: iconProps,
            ),
          ),
        ),
        if (numberOfNotifications > 0) _buildNotificationIcon()
      ],
    );
  }

  Widget _buildNotificationIcon() {
    final Mix containerStyle = Mix(
      bgColor(OldThemeSAKS.colors.error),
      width(18),
      height(18),
      rounded(50),
    );

    return Positioned(
      key: Key(NotificationBell.badgeKey),
      top: 5,
      right: 5,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Box(mix: containerStyle),
          CustomTypography(
            variant: TypographyVariant.h7,
            color: Colors.white,
            text: numberOfNotifications.toString(),
          ),
        ],
      ),
    );
  }
}
