import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pra/app_ui.dart';

class FontFamily {
  static final sen = 'Sen';
}

class AppStyle {
  // static const TextStyle title = TextStyle(
  //     fontSize: 32, fontFamily: AppFonts.roboto, color: Colors.redAccent);

  // static final TextStyle title =
  //     GoogleFonts.sen(fontSize: 50, color: Colors.green);

  static TextStyle h6 = TextStyle(
      fontFamily: FontFamily.sen, fontSize: 9.89, color: Colors.black);
  static TextStyle h5 =
      TextStyle(fontFamily: FontFamily.sen, fontSize: 16, color: Colors.black);
  static TextStyle h4 = TextStyle(
      fontFamily: FontFamily.sen, fontSize: 25.89, color: Colors.white);
  static TextStyle h3 = TextStyle(
      fontFamily: FontFamily.sen, fontSize: 41.89, color: Colors.white);
  static TextStyle h2 = TextStyle(
      fontFamily: FontFamily.sen, fontSize: 67.77, color: Colors.black);
  static TextStyle h1 = TextStyle(
      fontFamily: FontFamily.sen, fontSize: 109.66, color: Colors.black);
}
