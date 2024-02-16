import 'package:flutter/material.dart';

class ColorConstant {
  static Color green80001 = fromHex('#396a38');

  static Color yellow20001 = fromHex('#fde09c');
  static Color orangeA10002 = fromHex('#fed884');

  static Color redA700B5 = fromHex('#b5d00000');

  static Color green800 = fromHex('#10ab18');

  static Color yellow20002 = fromHex('#fee19d');

  static Color black9003f = fromHex('#3f000000');

  static Color black900 = fromHex('#000000');

  static Color blueGray900 = fromHex('#333333');

  static Color redA700 = fromHex('#ff0000');

  static Color yellow200 = fromHex('#ffe29d');

  static Color orangeA100 = fromHex('#ffd77b');

  static Color gray700 = fromHex('#565656');

  static Color indigo900E5 = fromHex('#e5090077');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color green400E5 = fromHex('#e556b860');

  static Color blueGray400 = fromHex('#8c8c8c');

  static Color blue800 = fromHex('#256eb3');

  static Color lime700 = fromHex('#cab50b');

  static Color amber600 = fromHex('#ffb200');

  static Color lime900 = fromHex('#72440e');

  static Color gray900 = fromHex('#062408');

  static Color blue600 = fromHex('#1a8ada');

  static Color amber100 = fromHex('#ffeab9');
  static Color amberUltraLight = fromHex('#fff8e8');

  static Color yellow50 = fromHex('#fff8e7');

  static Color deepPurple90082 = fromHex('#820f16ab');

  static Color gray200 = fromHex('#e9e7e7');

  static Color orange100 = fromHex('#fcdf9c');

  static Color amber10001 = fromHex('#ffeaba');

  static Color black90033 = fromHex('#33000000');

  static Color black90099 = fromHex('#99000000');

  static Color indigo200 = fromHex('#acaee7');

  static Color black900Cc = fromHex('#cc000000');

  static Color bluegray400 = fromHex('#888888');

  static Color indigo90001 = fromHex('#22187d');

  static Color indigo90002 = fromHex('#22177e');

  static Color indigo900 = fromHex('#090077');

  static Color whiteA700 = fromHex('#ffffff');

  static Color orangeA10001 = fromHex('#ffd77c');

  static BoxDecoration appGradient = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [Colors.white, Color(0xFFFFEAB9), Color(0xFFFFD77B)],
    ),
  );

  static Color amberA700 = fromHex('#f6ae07');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color black9007f = fromHex('#7f000000');

  static Color orange50B1 = fromHex('#b1fff7e4');

  static Color black9007a = fromHex('#7a000000');

  static Color yellow20023 = fromHex('#23ffe19d');

  static Color lightGreen900 = fromHex('#286a23');

  static Color black90087 = fromHex('#87000000');

  static Color black90083 = fromHex('#83000000');

  static Color lightGreen800 = fromHex('#54ab0f');

  static Color whiteA70019 = fromHex('#19ffffff');

  static Color gray600 = fromHex('#787878');

  static Color yellow10069 = fromHex('#69ffefcc');

  static Color black900A2 = fromHex('#a2000000');

  static Color amber200 = fromHex('#ffdf96');

  static Color orange10000 = fromHex('#00ffe5a9');

  static Color black90071 = fromHex('#71000000');

  static Color redA70001 = fromHex('#ff0101');
}
