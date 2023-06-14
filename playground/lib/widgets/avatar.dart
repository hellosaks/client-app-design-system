import 'package:client_app_design_system/components/avatar/avatar.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:playground/render_service.dart';

class AvatarDynamicView extends StatelessWidget {
  const AvatarDynamicView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RenderService().buildJson(
          json:
              """{"type":"avatar","args":{"radius":22,"size":25,"image_url":"https://picsum.photos/250?image=9"}}""",
          context: context,
        ),
        const SizedBox(
          height: 20,
        ),
        RenderService().buildJson(
          json: """{"type": "avatar","args": {"radius": 22,"size": 25}}""",
          context: context,
        ),
      ],
    );
  }
}

final avatar = ElementPreview(
  document: AvatarDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const AvatarDynamicView(),
      description: 'Example avatar',
    ),
  ],
);
