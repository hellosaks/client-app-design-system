// coverage:ignore-file

import "package:client_app_design_system/theme/old_palette.dart";
import "package:client_app_design_system/theme/palette.dart";
import "package:client_app_design_system/theme/shape.dart";
import "package:client_app_design_system/theme/typography.dart";

class ThemeSAKS {
  static final colors = Palette();
  static final typography = Typography();
  static final shape = Shape();
}

@Deprecated("Use NewThemeSAKS")
class OldThemeSAKS {
  @Deprecated("Use Palette")
  static final colors = OldPalette();
  static final typography = Typography();
  static final shape = Shape();
}
