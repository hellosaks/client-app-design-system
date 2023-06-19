import 'dart:convert';

import 'package:client_app_design_system/components/avatar/avatar.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart' hide Icon;
import 'package:playground/render_service.dart';

class AvatarDynamicView extends StatelessWidget {
  const AvatarDynamicView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
 
    return Column(
      children: [
        // RenderService().buildJson(
        //   json:
        //       """{"type":"avatar","args":{"radius":22,"size":25,"image_url":"https://picsum.photos/250?image=9"}}""",
        //   context: context,
        // ),
        const SizedBox(
          height: 20,
        ),
        // RenderService().buildJson(
        //   json: """{"type": "avatar","args": {"radius": 22,"size": 25}}""",
        //   context: context,
        // ),
        // Container(
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Row(
        //             children: [
        //               const CustomTypography(
        //                 text: "world!",
        //                 variant: TypographyVariant.h6,
        //               ),
        //               IconButton(
        //                 splashRadius: 20,
        //                 onPressed: () {},
        //                 icon: Icon(
        //                   props: IconProps(
        //                     variant: IconVariant.unicons,
        //                     uniconsProps: UniconsProps(
        //                       icon: UniconsLine.info_circle,
        //                       color: ThemeSAKS.colors.grayscale.division,
        //                       size: 20,
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //           const Spacer(),
        //           Flexible(
        //             child: SecondaryButton(
        //               text: "Ver mais",
        //               onPressed: () {},
        //               colorAttributes: ColorAttributesButton(
        //                 pressColor: Colors.black,
        //                 insideColor: const Color.fromRGBO(82, 116, 216, 1),
        //                 bgColor: const Color.fromRGBO(226, 235, 255, 1),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        RenderService().buildJson(
          json: jsonEncode(json),
          context: context,
        ),

//         RenderService().buildJson(
//           json: """
// {
//   "type": "gesture_detector",
//   "args": {
//     "onTap": "\${set_value('gesture', 'tap')}"
//   },
//   "child": {
//     "type": "container",
//     "args": {
//       "width": 250,
//       "height": 130,
//       "padding": [
//         16,
//         20
//       ],
//       "decoration": {
//         "color": "#F4F7FA",
//         "borderRadius": {
//           "type": "all",
//           "radius": 20
//         }
//       }
//     },
//     "child": {
//       "type": "column",
//       "args": {
//         "crossAxisAlignment": "start",
//         "mainAxisAlignment": "spaceBetween"
//       },
//       "children": [
//         {
//           "type": "custom_typography",
//           "args": {
//             "text": "SulAmérica Strateguie",
//             "variant": "h6",
//             "weight": "w600"
//           }
//         },
//         {
//           "type": "row",
//           "args": {
//             "mainAxisAlignment": "spaceBetween"
//           },
//           "children": [
//             {
//               "type": "column",
//               "args": {
//                 "crossAxisAlignment": "start"
//               },
//               "children": [
//                 {
//                   "type": "custom_typography",
//                   "args": {
//                     "text": "Fundo",
//                     "color": "#A1A8B4",
//                     "variant": "h6",
//                     "weight": "w500"
//                   }
//                 },
//                 {
//                   "type": "custom_typography",
//                   "args": {
//                     "text": "Moderado",
//                     "variant": "h6",
//                     "weight": "w500"
//                   }
//                 }
//               ]
//             },
//             {
//               "type": "column",
//               "args": {
//                 "crossAxisAlignment": "start"
//               },
//               "children": [
//                 {
//                   "type": "custom_typography",
//                   "args": {
//                     "text": "Rentabilidade (12 m)",
//                     "color": "#A1A8B4",
//                     "variant": "h6",
//                     "weight": "w500"
//                   }
//                 },
//                 {
//                   "type": "custom_typography",
//                   "args": {
//                     "text": "+15 %",
//                     "variant": "h6",
//                     "weight": "w500",
//                     "color": "#2CA735"
//                   }
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     }
//   }
// }""",
//           context: context,
//         ),
      ],
    );
  }
}

final avatar = ElementPreview(
  document: AvatarDocWidget(),
  previews: [
    WidgetPreview(
      widget: const AvatarDynamicView(),
      description: 'Example avatar',
    ),
  ],
);
