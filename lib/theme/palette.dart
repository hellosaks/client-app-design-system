import "package:flutter/material.dart";

class PrimaryColor {
  /// #5274D8 ![](https://dummyimage.com/24/5274D8.png&text=+)
  final saks = const Color(0xFF5274D8);

  /// #131C2F ![](https://dummyimage.com/24/131C2F.png&text=+)
  final sea = const Color(0xFF131C2F);

  /// #F0F7FD ![](https://dummyimage.com/24/F0F7FD.png&text=+)
  final sky = const Color(0xFFF0F7FD);
}

class SecondaryColor {
  /// #7590E0 ![](https://dummyimage.com/24/7590E0.png&text=+)
  final bay = const Color(0xFF7590E0);

  /// #DCE3F7 ![](https://dummyimage.com/24/DCE3F7.png&text=+)
  final ice = const Color(0xFFDCE3F7);

  /// #363E4E ![](https://dummyimage.com/24/363E4E.png&text=+)
  final stone = const Color(0xFF363E4E);
}

class UtilityColor {
  /// #2CA735 ![](https://dummyimage.com/24/2CA735.png&text=+)
  final conservative = const Color(0xFF2CA735);

  /// #E64C1D ![](https://dummyimage.com/24/E64C1D.png&text=+)
  final moderate = const Color(0xFFE64C1D);

  /// #FF3347 ![](https://dummyimage.com/24/FF3347.png&text=+)
  final aggressive = const Color(0xFFFF3347);
}

class SpecialColor {
  /// #EAF6EB ![](https://dummyimage.com/24/EAF6EB.png&text=+)
  final leaf = const Color(0xFFEAF6EB);

  /// #FF5263 ![](https://dummyimage.com/24/FF5263.png&text=+)
  final rose = const Color(0xFFFF5263);

  /// #E0E0E0 ![](https://dummyimage.com/24/E0E0E0.png&text=+)
  final smoke = const Color(0xFFE0E0E0);
}

class GrayColor {
  /// #DBDBDB ![](https://dummyimage.com/24/DBDBDB.png&text=+)
  final division = const Color(0xFFDBDBDB);

  /// #FFFFFF ![](https://dummyimage.com/24/FFFFFF.png&text=+)
  final snow = const Color(0xFFFFFFFF);
}

class Palette {
  final primary = PrimaryColor();
  final secondary = SecondaryColor();
  final utility = UtilityColor();
  final special = SpecialColor();
  final grayscale = GrayColor();
}
