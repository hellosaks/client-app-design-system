import 'package:client_app_design_system/components/custom_typography.dart';
import 'package:client_app_design_system/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const HotreloadWidgetbook());
}

class HotreloadWidgetbook extends StatelessWidget {
  const HotreloadWidgetbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookComponent(
              name: 'CustomTypography',
              isExpanded: true,
              useCases: [
                WidgetbookUseCase(
                  name: 'H1 Variant',
                  builder: (ctx) => Center(
                    child: CustomTypography(
                      text: ctx.knobs.text(
                        label: 'Title Label',
                        initialValue: 'HomePage',
                      ),
                      variant: ctx.knobs.options(label: "variant", options: [
                        const Option(label: "h1", value: TypographyVariant.h1),
                        const Option(label: "h2", value: TypographyVariant.h2),
                        const Option(label: "h3", value: TypographyVariant.h3),
                        const Option(label: "h4", value: TypographyVariant.h4),
                        const Option(label: "h5", value: TypographyVariant.h5),
                        const Option(label: "h6", value: TypographyVariant.h6),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
      ],
      
      appInfo: AppInfo(name: 'Example'),
    );
  }
}
