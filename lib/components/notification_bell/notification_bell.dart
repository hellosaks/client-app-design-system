import "package:client_app_design_system/client_app_design_system.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart" hide Icon;

@docWidget
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
    return Stack(
      children: [
        IconButton(
          key: Key(NotificationBell.bellKey),
          onPressed: onPressed,
          splashRadius: ThemeSAKS.shape.iconButtonSplashRadius,
          icon: SizedBox(
            width: 35,
            height: 35,
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
    return Positioned(
      key: Key(NotificationBell.badgeKey),
      top: 5,
      right: 5,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: OldThemeSAKS.colors.error),
          ),
          CustomTypography(
            variant: TypographyVariant.h7,
            color: Colors.white,
            text: numberOfNotifications > 9
                ? Constants.shortNotification
                : numberOfNotifications.toString(),
          ),
        ],
      ),
    );
  }
}
