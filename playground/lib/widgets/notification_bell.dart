import 'dart:convert';

import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/notification_bell/notification_bell.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart' hide Icon;
import 'package:playground/render_service.dart';

class NotificationBellDynamicView extends StatelessWidget {
  const NotificationBellDynamicView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lowNotifications = {
      "type": "notification_bell",
      "args": {
        "number_notifications": 1,
        "icon_props": {
          "variant": "unicons",
          "uniconsProps": {
            "color": "#131C2F",
            "icon": "bell",
          }
        },
      }
    };

    final manyNotifications = {
      "type": "notification_bell",
      "args": {
        "number_notifications": 200,
        "icon_props": {
          "variant": "unicons",
          "uniconsProps": {
            "color": "#131C2F",
            "icon": "bell",
          }
        },
      }
    };
    return Column(
      children: [
        RenderService().buildJson(
          json: jsonEncode(lowNotifications),
          context: context,
        ),
        const SizedBox(
          height: 20,
        ),
        RenderService().buildJson(
          json: jsonEncode(manyNotifications),
          context: context,
        ),
        const SizedBox(
          height: 20,
        ),
        NotificationBell(
          numberOfNotifications: 200,
          onPressed: () {},
          iconProps: IconProps(
            variant: IconVariant.unicons,
            uniconsProps: UniconsProps(
              icon: UniconsLine.bell,
            ),
          ),
        )
      ],
    );
  }
}

final notificationBell = ElementPreview(
  document: NotificationBellDocWidget(),
  previews: [
    WidgetPreview(
      widget: const NotificationBellDynamicView(),
      description: 'Example notification bell',
    ),
  ],
);
