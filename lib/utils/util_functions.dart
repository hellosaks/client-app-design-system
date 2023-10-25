String shortLink(String linkToShort) {
  final link = linkToShort.replaceAll("https://", "");

  if (link.length < 20) return link;

  final firstShorLink = link.substring(0, 10);
  final secondShorLink = link.substring(link.length - 10, link.length);

  return "$firstShorLink...$secondShorLink";
}
