import "package:flutter/material.dart";

String shortLink(String linkToShort) {
  final link = linkToShort.replaceAll("https://", "");

  if (link.length < 20) return link;

  final firstShorLink = link.substring(0, 10);
  final secondShorLink = link.substring(link.length - 10, link.length);

  return "$firstShorLink...$secondShorLink";
}

Color colorDecoder(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write("ff");
  buffer.write(hexString.replaceFirst("#", ""));
  return Color(int.parse(buffer.toString(), radix: 16));
}
