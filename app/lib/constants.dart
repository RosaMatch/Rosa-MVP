import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLORS
const Color backgroundColorCream1 = Color.fromRGBO(238, 242, 232, 1);
const Color rosaRedColor = Color.fromRGBO(82, 25, 39, 1);
const Color textFormBorderColor = Color.fromRGBO(227, 227, 210, 1);
const Color inactiveRedColor = Color.fromRGBO(176, 146, 156, 1);
const Color activeRedColor = Color.fromRGBO(108, 86, 92, 1);
const Color backgroundColorCream2 = Color.fromRGBO(208, 198, 188, 1);
const Color dividerColor = Color.fromRGBO(176, 146, 156, 1);

//const Size loginButtonSize = Size(300, 30);

//Styles

// const TextStyle mainTextStyle = TextStyle(
//   color: Colors.white,
//   decoration: TextDecoration()
// );

const ButtonStyle loginButtonStyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.white),
  //textStyle: WidgetStatePropertyAll(mainTextStyle),
  //maximumSize: WidgetStatePropertyAll(loginButtonSize),
);

//Themes
const AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: rosaRedColor,
  toolbarHeight: 84,
);

// const BottomAppBarTheme bottomAppBarTheme = BottomAppBarTheme(
//   color: interactableBackgroundColor,
// );

const IconThemeData iconThemeData = IconThemeData(
  color: Colors.white,
);

ThemeData appTheme = ThemeData(
  primaryColor: backgroundColorCream1,
  scaffoldBackgroundColor: backgroundColorCream1,
  textTheme: GoogleFonts.kantumruyProTextTheme(),
  appBarTheme: appBarTheme,
  //bottomAppBarTheme: bottomAppBarTheme,
  dividerColor: dividerColor,
  iconTheme: iconThemeData,
);

//Function that takes a String as input and returns a filled InputDecoration
InputDecoration generateInputDecoration(String hint) {
  InputDecoration decoration = InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                hintText: hint,
              );

  return decoration;
}