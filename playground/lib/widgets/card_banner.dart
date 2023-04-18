import 'package:client_app_design_system/components/cards/card_banner.dart';
import 'package:client_app_design_system/components/cards/card_banner.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';

final cardBannerDoc = ElementPreview(
  document: CardBannerDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/banner_6.jpg",
        blurHash: "L66,JcHX-oH;L4=DF5v{4:ITwGKl",
        aspectRatio: 16 / 6,
        onPressed: () {},
      ),
      description: 'Example card banner',
    ),
    WidgetPreview(
      widget: CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/main_banner_2.png",
        blurHash: "LLDA1h5L-Lb1ITxYW?M{IxV{a^ou",
        onPressed: () {},
        title: "Acompanhe seu bônus",
      ),
      description: 'Example card banner with title and blur hash loading',
    ),
    WidgetPreview(
      widget: CardBanner(
        backgroundImage:
            "https://saks-app-banner-images.s3.us-east-2.amazonaws.com/banner_app_v2/main_banner_6.png",
        onPressed: () {},
        title: "Acompanhe seu bônus",
        buttonLabel: "Ver mais",
      ),
      description:
          'Example card banner with title and button and skeleton loading',
    ),
  ],
);
