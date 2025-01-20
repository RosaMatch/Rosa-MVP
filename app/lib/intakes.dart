import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'constants.dart';

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
  final nameController = TextEditingController();
  final gpaController = TextEditingController();
  final PageController _pageController = PageController();
  String? _selectedYear;
  String? _selectedYearCollege;
  String? _selectedAspect;
  String? _selectedImportance;
  String? _selectedGPAConsider;
  List<String>? _selectedSchools;

  @override
  void dispose() {
    nameController.dispose();
    gpaController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi, I'm Rosa!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: rosaRedColor),
                  ),
                  const Text(
                    "Nice to meet you. I am your college search companion, ready to help you find, apply, and get you into the school that's right for you!",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 10, height: 10),
                  const Divider(
                    color: rosaRedColor,
                    thickness: 2,
                  ),
                  const SizedBox(width: 20, height: 20),
                  const Text(
                    "Let's get to know each other better",
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 20, height: 20),
                  Form(
                    key: _formKey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "What is your preferred name?",
                          style: TextStyle(fontSize: 12),
                        ),
                        TextFormField(
                          key: const Key('name'),
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your preferred name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(width: 15, height: 15),
                        const Text(
                          "What year are you in school?",
                          style: TextStyle(fontSize: 12),
                        ),
                        DropdownButtonFormField<String>(
                          key: const Key('year'),
                          value: _selectedYear,
                          decoration: const InputDecoration(
                            hintText: 'Select your year in school',
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
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a year';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(width: 15, height: 15),
                        if (_selectedYear == 'I am a transfer student') ...[
                          const Text(
                            "What year are you in college?",
                            style: TextStyle(fontSize: 12),
                          ),
                          DropdownButtonFormField<String>(
                            key: const Key('collegeYear'),
                            value: _selectedYearCollege,
                            decoration: const InputDecoration(
                              hintText: 'Select your year in college',
                            ),
                            items: <String>['1st', '2nd', '3rd', '4th', 'Other']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedYearCollege = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a year';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(width: 15, height: 15),
                        ],
                        const Text(
                          "What aspect of your application would you like to work on together?",
                          style: TextStyle(fontSize: 12),
                        ),
                        DropdownButtonFormField<String>(
                          key: const Key('aspect'),
                          value: _selectedAspect,
                          decoration: const InputDecoration(
                            hintText: 'Select an aspect of your application',
                          ),
                          items: <String>[
                            'Essays',
                            'Funding(Scholarships, Financial Aid)',
                            'Understanding my College Fit',
                            'All of it!',
                            'Not too sure...'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedAspect = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select an aspect';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(width: 15, height: 15),
                        const Text(
                          "What is most important to you while researching colleges?",
                          style: TextStyle(fontSize: 12),
                        ),
                        DropdownButtonFormField<String>(
                          key: const Key('importance'),
                          value: _selectedImportance,
                          decoration: const InputDecoration(
                            hintText: 'Select what is most important to you',
                          ),
                          items: <String>[
                            'COA(Cost of Attendance)',
                            'Research Opportunities',
                            'Career Outlook',
                            'Study Abroad Opportunities',
                            'Cirriculum Style',
                            'Location',
                            'Sports',
                            'Community Engagement',
                            'Volunteerism',
                            'Academic Programs'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedImportance = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select an aspect';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(width: 15, height: 15),
                        const Text(
                          'Would you like to have us consider your GPA in matching and other in-app experiences?',
                          style: TextStyle(fontSize: 12),
                        ),
                        DropdownButtonFormField<String>(
                          key: const Key('gpaConsider'),
                          value: _selectedGPAConsider,
                          decoration: const InputDecoration(
                            hintText: 'Select Yes or No',
                          ),
                          items: <String>['Yes', 'No'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedGPAConsider = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select an option';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(width: 15, height: 15),
                        if (_selectedGPAConsider == 'Yes') ...[
                          const Text(
                            'What is your GPA?',
                            style: TextStyle(fontSize: 12),
                          ),
                          TextFormField(
                            key: const Key('gpa'),
                            controller: gpaController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your GPA',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your GPA';
                              }
                              return null;
                            },
                          ),
                        ],
                        const SizedBox(width: 20, height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey1.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                      'Name: ${nameController.text}\n'
                                      'Year: $_selectedYear\n'
                                      'College Year: $_selectedYearCollege\n'
                                      'Aspect: $_selectedAspect\n'
                                      'Importance: $_selectedImportance\n'
                                      'GPA Consider: $_selectedGPAConsider\n'
                                      'GPA: ${gpaController.text}\n',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  );
                                },
                              );
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: const Icon(
                            Icons.next_plan,
                            size: 24,
                            color: rosaRedColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "College Match",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: rosaRedColor),
                ),
                SizedBox(width: 10, height: 10),
                const Text(
                  "Let's begin by finding a few schools that fit you.",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 10, height: 10),
                Form(
                  key: _formKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "But first, are there any schools that you are currently interested in?",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 10, height: 10),
                      MultiSelectDialogField(
                        items: [
                          MultiSelectItem("School 1", "School 1"),
                          MultiSelectItem("School 2", "School 2"),
                          MultiSelectItem("School 3", "School 3"),
                          MultiSelectItem("School 4", "School 4"),
                          MultiSelectItem("School 5", "School 5"),
                        ],
                        title: const Text("Schools"),
                        selectedColor: rosaRedColor,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        buttonIcon: const Icon(
                          Icons.school,
                          color: Colors.grey,
                        ),
                        buttonText: const Text(
                          "Select Schools",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        searchable: true,
                        onConfirm: (results) {
                          setState(() {
                            _selectedSchools = results.cast<String>();
                          });
                        },
                        validator: (values) {
                          if (values == null || values.isEmpty) {
                            return 'Please select at least one school';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(width: 15, height: 15),
                      const Text(
                        "Respond to the prompts on the following page honestly. Your responses will influence your in-app counseling experience.",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 10, height: 10),
                      const Text(
                        "This questionare should take about 10 minutes to complete, so consider each question for a few moments before answering.",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 10, height: 10),
                      const Text(
                        "Colleges will never be able to see your responses.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      const SizedBox(width: 15, height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey2.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                    'Schools: $_selectedSchools\n',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              },
                            );
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: const Icon(
                          Icons.next_plan,
                          size: 24,
                          color: rosaRedColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // 
          // 
          // START HERE FOR OTHER FORM PAGES!!!
          //  | | |
          //  | | |
          //  V V V
          SingleChildScrollView(),
        ],
      ),
    );
  }
}
