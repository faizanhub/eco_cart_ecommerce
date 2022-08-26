extension HexString on String {
  int getHexValue() => int.parse(replaceAll('#', '0xff'));
}
