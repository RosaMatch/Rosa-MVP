import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLORS
const Color backgroundColorCream1 = Color.fromRGBO(238, 242, 232, 1);
const Color backgroundColorCream2 = Color.fromRGBO(208, 198, 188, 1);
const Color backgroundColorCream3 = Color.fromRGBO(243,252, 250, 1);
const Color rosaRedColor = Color.fromRGBO(82, 25, 39, 1);
const Color rosaRedSplashColor = Color.fromRGBO(82, 25, 39, 0.3);
const Color textFormBorderColor = Color.fromRGBO(227, 227, 210, 1);
const Color inactiveRedColor = Color.fromRGBO(176, 146, 156, 1);
const Color activeRedColor = Color.fromRGBO(108, 86, 92, 1);
const Color dividerColor = Color.fromRGBO(176, 146, 156, 1);

//const Size loginButtonSize = Size(300, 30);

//Styles

const ButtonStyle loginButtonStyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.white),
);

//Themes
const AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: rosaRedColor,
  toolbarHeight: 50,
);

const IconThemeData iconThemeData = IconThemeData(
  color: Colors.white,
);

ThemeData appTheme = ThemeData(
  primaryColor: backgroundColorCream1,
  scaffoldBackgroundColor: backgroundColorCream1,
  textTheme: GoogleFonts.kantumruyProTextTheme(),
  appBarTheme: appBarTheme,
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

const double iconSize= 50.0;
const Color iconColor = Color.fromRGBO(82, 25, 39, 1);
const Color iconColor2 = Color.fromRGBO(243, 252, 250, 1);
//ICONS
const IconData essayIcon = Icons.history_edu_outlined;
const IconData fundingIcon = Icons.savings_outlined;
const IconData researchSchoolsIcon = Icons.search_outlined;
const IconData outreachIcon = Icons.question_answer_outlined;
const IconData fitfactorIcon = Icons.extension_outlined;
const IconData everythingIcon = Icons.sentiment_very_satisfied_outlined;

const IconData COAIcon = Icons.payments_outlined;
const IconData researchIcon = Icons.biotech_outlined;
const IconData careerIcon = Icons.work_outline;
const IconData sportsIcon = Icons.sports_football_outlined;
const IconData locationIcon = Icons.location_on_outlined;
const IconData volunteerIcon = Icons.volunteer_activism_outlined;
const IconData communityIcon = Icons.groups_outlined;
const IconData academicIcon = Icons.account_balance_outlined;
const IconData curriculumIcon = Icons.library_books_outlined;
const IconData studyAbroadIcon = Icons.explore_outlined;


//STRINGS

const String testCollegeProfileRoute = '/testcollege_profile';
const String uBuffProfileRoute = '/UB_profile';
const String wesProfileRoute = '/WES_profile';
const String hunterProfileRoute = '/H_profile';
const String juniorPfpPath = 'assets/images/juniorpfp.png';
const String rosaIconPath = 'assets/icons/rosa_icon.png';