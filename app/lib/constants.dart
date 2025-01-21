import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLORS
const Color backgroundColorCream1 = Color.fromRGBO(238, 242, 232, 1);
const Color rosaRedColor = Color.fromRGBO(82, 25, 39, 1);
const Color rosaRedSplashColor = Color.fromRGBO(82, 25, 39, 0.3);
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
  toolbarHeight: 50,
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

const double iconSize= 30.0;
//ICONS
const Icon essayIcon = Icon(Icons.history_edu_outlined, color: Color.fromRGBO(82, 25, 39, 1), size: iconSize,);
const Icon fundingIcon = Icon(Icons.savings_outlined, color: Color.fromRGBO(82, 25, 39, 1), size: iconSize,);
const Icon researchSchoolsIcon = Icon(Icons.search_outlined, color: Color.fromRGBO(82, 25, 39, 1), size: iconSize,);
const Icon outreachIcon = Icon(Icons.question_answer_outlined, color: Color.fromRGBO(82, 25, 39, 1), size: iconSize,);
const Icon fitfactorIcon = Icon(Icons.extension_outlined, color: Color.fromRGBO(82, 25, 39, 1), size: iconSize,);
const Icon everythingIcon = Icon(Icons.sentiment_very_satisfied_outlined, color: Color.fromRGBO(82, 25, 39, 1), size: iconSize,);


const Icon COAIcon = Icon(Icons.payments_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);
const Icon researchIcon = Icon(Icons.biotech_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);
const Icon careerIcon = Icon(Icons.work_outline, color: Color.fromRGBO(243, 252, 250, 1), size: 30.0,);
const Icon sportsIcon = Icon(Icons.sports_football_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);
const Icon locationIcon = Icon(Icons.location_on_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);
const Icon volunteerIcon = Icon(Icons.volunteer_activism_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);
const Icon communityIcon = Icon(Icons.groups_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: 30.0,);
const Icon academicIcon = Icon(Icons.account_balance_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);
const Icon curriculumIcon = Icon(Icons.library_books_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);
const Icon studyAbroadIcon = Icon(Icons.explore_outlined, color: Color.fromRGBO(243, 252, 250, 1), size: iconSize,);

//STRINGS

const String testCollegeProfilePath = '/testcollege_profile';