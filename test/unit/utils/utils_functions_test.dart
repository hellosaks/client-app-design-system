import "package:client_app_design_system/utils/util_functions.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("should return short link", () {
    const String link = "https://www.google.com";

    expect(shortLink(link), "www.google.com");

    const String longLink = "https://github.com/hellosaks/";

    expect(shortLink(longLink), "github.com...hellosaks/");

    const linkWith20char = "https://github.com/hellosaks";
    expect(shortLink(linkWith20char), "github.com.../hellosaks");
  });
}
