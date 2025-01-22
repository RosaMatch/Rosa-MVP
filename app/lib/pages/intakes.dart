import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/constants.dart';

class IntakeForm extends StatefulWidget {
  const IntakeForm({super.key});

  @override
  Intakes createState() {
    return Intakes();
  }
}

class Intakes extends State<IntakeForm> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  final ValueNotifier<bool> _isForm1Valid = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isForm2Valid = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isForm3Valid = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isForm4Valid = ValueNotifier<bool>(false);
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  final nameController = TextEditingController();
  String? _selectedYear;
  String? _thisCycle;
  final Set<String> _selectedImagesForm2 = {};
  final Set<String> _selectedImagesForm3 = {};
  String? _gpaConsideration;
  final gpaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currentPageNotifier.value = _pageController.page?.round() ?? 0;
    });
    nameController.addListener(_validateForm1);
    gpaController.addListener(_validateForm4);
    _pageController.addListener(() {
      final currentPage = _pageController.page?.round() ?? 0;
      _currentPageNotifier.value = currentPage;
    });
  }

  void _validateForm1() {
    _isForm1Valid.value = _formKey1.currentState?.validate() ?? false;
  }

  void _validateForm2() {
    _isForm2Valid.value = _formKey2.currentState?.validate() ?? false;
  }

  void _validateForm3() {
    _isForm3Valid.value = _formKey3.currentState?.validate() ?? false;
  }

  void _validateForm4() {
    _isForm4Valid.value = _formKey4.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    nameController.dispose();
    gpaController.dispose();
    _pageController.dispose();
    _isForm1Valid.dispose();
    _isForm2Valid.dispose();
    _isForm3Valid.dispose();
    _isForm4Valid.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 140, bottom: 74),
                  child: Image.asset(
                    'assets/icons/rosa_icon_circle.png',
                    height: 160,
                    width: 160,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hi, I'm Rosa!",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: rosaRedColor,
                      ),
                    ),
                    SizedBox(width: 30, height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "I am your college search companion, ready to help you find, apply, and get you into ",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black38),
                            ),
                            TextSpan(
                              text: "the school that's right for you!",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 40, height: 40),
                const Text(
                  "1/4",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: rosaRedColor),
                ),
                SizedBox(width: 40, height: 40),
                const Text(
                  "Let's get to know each other better",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: rosaRedColor),
                ),
                const SizedBox(width: 40, height: 40),
                Form(
                  key: _formKey1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "What is your preferred name?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10, height: 10),
                      TextFormField(
                        key: const Key('name'),
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Preferred Name here',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your preferred name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _validateForm1();
                        },
                      ),
                      const SizedBox(width: 40, height: 40),
                      const Text(
                        "What year are you in school?",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 10, height: 10),
                      DropdownButtonFormField<String>(
                        key: const Key('year'),
                        value: _selectedYear,
                        decoration: const InputDecoration(
                          hintText: 'Select Year',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        items: <String>[
                          'Freshman(9th)',
                          'Sophomore(10th)',
                          'Junior(11th)',
                          'Senior(12th)',
                          'I am a transfer student',
                          'Other'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedYear = newValue;
                          });
                          _validateForm1();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a year';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(width: 40, height: 40),
                      const Text(
                        "Do you plan on applying this cycle?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10, height: 10),
                      DropdownButtonFormField<String>(
                        key: const Key('thisCycle'),
                        value: _thisCycle,
                        decoration: const InputDecoration(
                          hintText: 'Select Yes or No',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        items: <String>['Yes', 'No'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _thisCycle = newValue;
                          });
                          _validateForm1();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 65.0, left: 45.0, right: 45.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 40, height: 40),
                const Text(
                  "2/4",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: rosaRedColor),
                ),
                SizedBox(width: 40, height: 40),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: nameController,
                  builder: (context, value, child) {
                    return Text(
                      "So ${value.text}, how can I help?",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: rosaRedColor),
                    );
                  },
                ),
                Form(
                    key: _formKey2,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            children: List.generate(6, (index) {
                              final iconData = [
                                essayIcon,
                                fundingIcon,
                                researchSchoolsIcon,
                                outreachIcon,
                                fitfactorIcon,
                                everythingIcon,
                              ][index];
                              final iconText = [
                                'Essay Writing',
                                'Funding',
                                'Researching',
                                'College Outreach',
                                'Fit Factor',
                                'Everything!',
                              ][index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_selectedImagesForm2
                                        .contains(iconText)) {
                                      _selectedImagesForm2.remove(iconText);
                                    } else {
                                      _selectedImagesForm2.add(iconText);
                                    }
                                    _validateForm2();
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: _selectedImagesForm2
                                              .contains(iconText)
                                          ? rosaRedColor
                                          : Colors.transparent,
                                    border: Border.all(
                                      color: _selectedImagesForm2
                                              .contains(iconText)
                                          ? inactiveRedColor
                                          : rosaRedColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        iconData,
                                        size: iconSize,
                                        color: _selectedImagesForm2
                                                .contains(iconText)
                                            ? backgroundColorCream3
                                            : rosaRedColor,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        iconText,
                                        style: TextStyle(
                                          color: _selectedImagesForm2
                                                  .contains(iconText)
                                              ? backgroundColorCream3
                                              : rosaRedColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ]))
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40.0, left: 45.0, right: 45.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 40, height: 40),
                const Text(
                  "3/4",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: rosaRedColor),
                ),
                SizedBox(width: 40, height: 40),
                const Text(
                  "What is most important to you while researching colleges?",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: rosaRedColor),
                ),
                const SizedBox(width: 40, height: 40),
                Form(
                    key: _formKey3,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: rosaRedColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: SizedBox(
                                height: 500,
                                child: SingleChildScrollView(
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: List.generate(10, (index) {
                                      final iconData = [
                                        COAIcon,
                                        researchIcon,
                                        careerIcon,
                                        sportsIcon,
                                        locationIcon,
                                        volunteerIcon,
                                        communityIcon,
                                        academicIcon,
                                        curriculumIcon,
                                        studyAbroadIcon,
                                      ][index];
                                      final iconText = [
                                        'Cost',
                                        'Research',
                                        'Career',
                                        'Sports',
                                        'Location',
                                        'Volunteer',
                                        'Community',
                                        'Academics',
                                        'Curriculum',
                                        'Study Abroad',
                                      ][index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (_selectedImagesForm3
                                                .contains(iconText)) {
                                              _selectedImagesForm3
                                                  .remove(iconText);
                                            } else {
                                              _selectedImagesForm3
                                                  .add(iconText);
                                            }
                                            _validateForm3();
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(8.0),
                                          padding: const EdgeInsets.all(6.0),
                                          decoration: BoxDecoration(
                                            color: _selectedImagesForm3
                                                      .contains(iconText)
                                                  ? backgroundColorCream3
                                                  : Colors.transparent,
                                            border: Border.all(
                                              color: _selectedImagesForm3
                                                      .contains(iconText)
                                                  ? activeRedColor
                                                  : backgroundColorCream3,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                iconData,
                                                size: iconSize,
                                                color: _selectedImagesForm3
                                                        .contains(iconText)
                                                    ? iconColor
                                                    : backgroundColorCream3,
                                              ),
                                              const SizedBox(height: 8.0),
                                              Text(
                                                iconText,
                                                style: TextStyle(
                                                  color: _selectedImagesForm3
                                                          .contains(iconText)
                                                      ? rosaRedColor
                                                      : backgroundColorCream3,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ))
                        ]))
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(width: 40, height: 40),
              const Text(
                "4/4",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: rosaRedColor),
              ),
              SizedBox(width: 40, height: 40),
              const Text(
                "Wrapping things up...",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: rosaRedColor),
              ),
              const SizedBox(width: 40, height: 40),
              Form(
                key: _formKey4,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Would you like to have us consider your GPA in matching and other in-app experiencs?",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 20, height: 20),
                    DropdownButtonFormField(
                      key: const Key('gpaConsideration'),
                      value: _gpaConsideration,
                      decoration: const InputDecoration(
                        hintText: 'Select Yes or No',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      items: <String>['Yes', 'No'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _gpaConsideration = newValue;
                        });
                        _validateForm4();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    if (_gpaConsideration == 'Yes') ...[
                      const SizedBox(width: 40, height: 40),
                      const Text(
                        "What is your current GPA?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10, height: 10),
                      TextFormField(
                        key: const Key('gpa'),
                        controller: gpaController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your GPA here',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your GPA';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _validateForm4();
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ]),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 140, bottom: 74),
                  child: Image.asset(
                    'assets/icons/rosa_icon_circle.png',
                    height: 160,
                    width: 160,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Thank you for sharing!",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: rosaRedColor,
                      ),
                    ),
                    SizedBox(width: 30, height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "We are processing your information...",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30, height: 30),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).go('/MatchPage1State');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: rosaRedColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Continue to Matches',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, pageIndex, child) {
                  if (pageIndex == 5) {
                    return SizedBox.shrink(); // Hide the button on page 5
                  }
                  bool isButtonEnabled;
                  switch (pageIndex) {
                    case 0:
                      isButtonEnabled = true;
                      break;
                    case 1:
                      isButtonEnabled = _isForm1Valid.value;
                      break;
                    case 2:
                      isButtonEnabled = _isForm2Valid.value;
                      break;
                    case 3:
                      isButtonEnabled = _isForm3Valid.value;
                      break;
                    case 4:
                      isButtonEnabled = _isForm4Valid.value;
                      break;
                    case 5:
                      isButtonEnabled = false;
                      break;
                    default:
                      isButtonEnabled = false;
                  }

                  return FloatingActionButton(
                    onPressed: isButtonEnabled
                        ? () {
                            // Perform validation and page change here
                            if (_currentPageNotifier.value == 1) {
                              _validateForm1(); // Validate form 1
                            } else if (_currentPageNotifier.value == 2) {
                              _validateForm2(); // Validate form 2
                            } else if (_currentPageNotifier.value == 3) {
                              _validateForm3(); // Validate form 3
                            } else if (_currentPageNotifier.value == 4) {
                              _validateForm4(); // Validate form 4
                            }

                            // Ensure that the page is updated based on the validation state
                            setState(() {
                              // Trigger rebuild to refresh the button state after validation
                            });

                            // Move to the next page if the form is valid
                            if (isButtonEnabled) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            }
                          }
                        : null,
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: rosaRedColor,
                      size: 24,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
