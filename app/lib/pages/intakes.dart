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
    _pageController.addListener(() {
      final currentPage = _pageController.page?.round() ?? 0;
      _currentPageNotifier.value = currentPage;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    gpaController.dispose();
    _pageController.dispose();
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
          Stack(
            children: [
              SingleChildScrollView(
                padding:
                    const EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
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
                        const Text(
                          "Hi, I'm Rosa!",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: rosaRedColor,
                          ),
                        ),
                        const SizedBox(height: 30),
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
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "I am your college search companion, ready to help you find, apply, and get you into ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black38,
                                  ),
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
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: rosaRedColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SingleChildScrollView(
                padding:
                    const EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 40, height: 40),
                        const Text(
                          "1/4",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: rosaRedColor,
                          ),
                        ),
                        const SizedBox(width: 40, height: 40),
                        const Text(
                          "Let's get to know each other better",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: rosaRedColor,
                          ),
                        ),
                        const SizedBox(width: 40, height: 40),
                        Form(
                          key: _formKey1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your preferred name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(width: 40, height: 40),
                              const Text(
                                "What year are you in school?",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 10, height: 10),
                              DropdownButtonFormField<String>(
                                key: const Key('year'),
                                value: _selectedYear,
                                decoration: const InputDecoration(
                                  hintText: 'Select Year',
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                ),
                                items: <String>[
                                  'Freshman(9th)',
                                  'Sophomore(10th)',
                                  'Junior(11th)',
                                  'Senior(12th)',
                                  'I am a transfer student',
                                  'Other',
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                ),
                                items:
                                    <String>['Yes', 'No'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _thisCycle = newValue;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Yes or No';
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
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey1.currentState!.validate()) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: rosaRedColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SingleChildScrollView(
                padding:
                    const EdgeInsets.only(top: 65.0, left: 45.0, right: 45.0),
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
                    const SizedBox(width: 40, height: 40),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color:
                                        _selectedImagesForm2.contains(iconText)
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey2.currentState!.validate()) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: rosaRedColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SingleChildScrollView(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 45.0, right: 45.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 40, height: 40),
                    const Text(
                      "3/4",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: rosaRedColor,
                      ),
                    ),
                    const SizedBox(width: 40, height: 40),
                    const Text(
                      "What is most important to you while researching colleges?",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: rosaRedColor,
                      ),
                    ),
                    const SizedBox(width: 40, height: 40),
                    Form(
                      key: _formKey3,
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
                                  physics: const NeverScrollableScrollPhysics(),
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
                                            _selectedImagesForm3.add(iconText);
                                          }
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey3.currentState!.validate()) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: rosaRedColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SingleChildScrollView(
                padding:
                    const EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 40, height: 40),
                    const Text(
                      "4/4",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: rosaRedColor,
                      ),
                    ),
                    const SizedBox(width: 40, height: 40),
                    const Text(
                      "Wrapping things up...",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: rosaRedColor,
                      ),
                    ),
                    const SizedBox(width: 40, height: 40),
                    Form(
                      key: _formKey4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Would you like to have us consider your GPA in matching and other in-app experiences?",
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your GPA';
                                }
                                return null;
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey4.currentState!.validate()) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: rosaRedColor,
                    size: 24,
                  ),
                ),
              ),
            ],
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
    );
  }
}
