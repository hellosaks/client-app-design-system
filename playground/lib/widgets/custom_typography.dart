import 'package:client_app_design_system/components/custom_typography.dart';
import 'package:client_app_design_system/components/custom_typography.doc_widget.dart';
import 'package:client_app_design_system/utils/enums.dart';
import 'package:doc_widget/doc_widget.dart';

final customTypographyDoc = ElementPreview(
  document: CustomTypographyDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.h1,
      ),
      description: 'Default H1 variant text',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.h2,
      ),
      description: 'H2 variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.h3,
      ),
      description: 'H3 variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.h4,
      ),
      description: 'H4 variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.h5,
      ),
      description: 'H5 variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.h6,
      ),
      description: 'H6 variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.h7,
      ),
      description: 'H7 variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.cta,
      ),
      description: 'CTA variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.underline,
      ),
      description: 'Underline variant',
    ),
    WidgetPreview(
      widget: const CustomTypography(
        text: "Hello, world!",
        variant: TypographyVariant.strikethrough,
      ),
      description: 'Strikethrough variant',
    ),
  ],
);
