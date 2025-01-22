import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:rosa/pages/home/homepage.dart';
import '../constants/constants.dart';
import 'package:confetti/confetti.dart';

import '../main.dart';

class MatchPage1 extends StatefulWidget {
  const MatchPage1({super.key});

  @override
  State<MatchPage1> createState() => _MatchPage1State();
}

class _MatchPage1State extends State<MatchPage1> {
  List<String>? _selectedSchools = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 26, // Font size for the entire text
                          color: rosaRedColor // Default text color
                          ),
                      children: [
                    TextSpan(
                      text: "College ", // Regular text
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                        text: "Match", // Bold text
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: rosaRedColor)),
                  ])),
              SizedBox(width: 10, height: 30),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 16, // Font size for the entire text
                          color: rosaRedColor // Default text color
                          ),
                      children: [
                    TextSpan(
                      text: "College Match", // Regular text
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    TextSpan(
                        text:
                            " is a new way to find colleges that are best suited for you. ", // Bold text
                        style: TextStyle(color: rosaRedColor)),
                  ])),
              SizedBox(width: 10, height: 30),
              const Text(
                  "Powered by decades of narrative identity research, we aim to match your characteristics with those of students at colleges nationwide—all in a few short questions.",
                  style: TextStyle(fontSize: 12, color: activeRedColor)),
              SizedBox(width: 10, height: 20),
              const Text(
                "But first, let's begin by establishing a few schools/n you are already interested in",
                style: TextStyle(fontSize: 12, color: activeRedColor),
              ),
              const SizedBox(width: 10, height: 20),
              SizedBox(
                  width: 300,
                  child: MultiSelectDialogField(
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
                  )),
              Spacer(),
              Visibility(
                  visible: _selectedSchools!.isNotEmpty,
                  child: const Text(
                    "Respond to the prompts on the following page honestly. Your responses will influence your in-app counseling experience.",
                    style: TextStyle(fontSize: 8, color: dividerColor),
                  )),
              const SizedBox(width: 10, height: 10),
              Visibility(
                  visible: _selectedSchools!.isNotEmpty,
                  child: const Text(
                    "This questionnaire should take about 10 minutes to complete, so consider each question for a few moments before answering.",
                    style: TextStyle(fontSize: 8, color: dividerColor),
                  )),
              const SizedBox(width: 10, height: 10),
              Visibility(
                  visible: _selectedSchools!.isNotEmpty,
                  child: const Text(
                    "Colleges will never be able to see your responses.",
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: dividerColor),
                  )),
              const SizedBox(width: 15, height: 15),

              Visibility(
                  visible: _selectedSchools!.isNotEmpty,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding:
                            const EdgeInsets.only(right: 10.0, bottom: 80.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MatchPage2()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(20),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: rosaRedColor,
                            size: 24,
                          ),
                        )),
                  ))
            ])));
  }
}

class MatchPage2 extends StatefulWidget {
  const MatchPage2({super.key});

  @override
  State<MatchPage2> createState() => _MatchPage2State();
}

class _MatchPage2State extends State<MatchPage2> {
  final textInput1Controller = TextEditingController();

  @override
  void dispose() {
    textInput1Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Tell a story about when you persevered through a difficult situation.",
                style: TextStyle(
                    fontSize: 20,
                    color: rosaRedColor,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(width: 10, height: 20),
              // const Divider(color: rosaRedColor, thickness: 1.5,),
              const SizedBox(width: 10, height: 50),
              TextField(
                  controller: textInput1Controller,
                  cursorColor: textFormBorderColor,
                  minLines: 5,
                  maxLines: 15,
                  decoration: InputDecoration(
                      hintText: "100 words minimum",
                      hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffb0929c)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: textFormBorderColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: textFormBorderColor,
                          width: 1.0,
                        ),
                      ))),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, bottom: 80.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MatchPage3()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.all(20),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: rosaRedColor,
                        size: 24,
                      ),
                    )),
              )
            ])));
  }
}

class MatchPage3 extends StatefulWidget {
  const MatchPage3({super.key});

  @override
  State<MatchPage3> createState() => _MatchPage3State();
}

class _MatchPage3State extends State<MatchPage3> {
  final textInput2Controller = TextEditingController();

  @override
  void dispose() {
    textInput2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 90.0, left: 45.0, right: 45.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Share a story about a topic, idea, or experience that sparked your curiosity.",
                style: TextStyle(
                    fontSize: 20,
                    color: rosaRedColor,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(width: 10, height: 20),
              // const Divider(color: rosaRedColor, thickness: 1.5,),
              const SizedBox(width: 10, height: 50),
              TextField(
                  controller: textInput2Controller,
                  cursorColor: textFormBorderColor,
                  minLines: 5,
                  maxLines: 15,
                  decoration: InputDecoration(
                      hintText: "100 words minimum",
                      hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffb0929c)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: textFormBorderColor, width: 2)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: textFormBorderColor,
                          width: 1.0,
                        ),
                      ))),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, bottom: 80.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MatchPage4()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.all(20),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: rosaRedColor,
                        size: 24,
                      ),
                    )),
              )
            ])));
  }
}

class MatchPage4 extends StatelessWidget {
  const MatchPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: backgroundColorCream1,
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 70.0,
                  left: 30.0,
                  right: 30.0), // Custom padding at the top
              child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15.0),
                  children: <Widget>[
                    Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("It's a Match!",
                              style: TextStyle(
                                  color: rosaRedColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24)),
                          const SizedBox(width: 10, height: 70),
                          const Text("Press to expand",
                              style: TextStyle(
                                  color: dividerColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          const SizedBox(width: 10, height: 10),
                          const Match4(),
                          const SizedBox(width: 10, height: 50),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, bottom: 80.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.go('/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.white,
                                    padding: EdgeInsets.all(20),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: rosaRedColor,
                                    size: 24,
                                  ),
                                )),
                          )
                        ])
                  ]),
            )));
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.imgValue,
    required this.expandedValue2,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  String imgValue;
  String expandedValue2;
  bool isExpanded;
}

List matchDesc = [
  'Best Fit College 🌟',
  'Great Match ⭐',
  'Preference Match ✨',
  "Discovery Match 🔭"
];
List colleges = [
  'Reed College',
  'Wesleyan University',
  'Hunter College',
  "University at Buffalo"
];
List collegeText = [
  'Reedies are passionate intellectuals, and distinctly authentic—eager for new experiences with others just as eager as they are.',
  "Students at Wes are constantly seeking new pursuits, always ready to take on exiting challenges with those around them—whether the world is ready for them or not!",
  "Students at Hunter College range from explorative go-getters to early-professionals—representing an uniquely diverse array of thoughts and experiences.",
  "The average student at UBuff is curious, yet focused, with a mind always towards what's next."
];
List collegeimgs = [
  'assets/images/reedEmbrace.jpg',
  'assets/images/wesleyan.jpg',
  'assets/images/hunterCollegeGobrrrbeepbeep.jpg',
  "assets/images/handsUbuff.jpg"
];
List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
        headerValue: colleges[index],
        expandedValue: matchDesc[index],
        imgValue: collegeimgs[index],
        expandedValue2: collegeText[index]);
  });
}

class Match4 extends StatefulWidget {
  const Match4({super.key});

  @override
  State<Match4> createState() => _Match4State();
}

class _Match4State extends State<Match4> {
  late ConfettiController _confettiController;
  final List<Item> _data = generateItems(4);

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }
  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _data.map<Widget>((Item item) {
          return GestureDetector(
            onTap: () {
              setState(() {
                item.isExpanded = !item.isExpanded;
              });
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              color: backgroundColorCream2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    colors: const [rosaRedColor, activeRedColor, inactiveRedColor, Colors.white70],
                    numberOfParticles: 20,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: item.isExpanded ? 250 : 100,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(item.imgValue), // Background image
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(0, 0, 0, .2), BlendMode.darken)),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          item.headerValue,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: item.isExpanded ? 200 : 0,
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: rosaRedColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: item.isExpanded
                        ? ListTile(
                            tileColor: rosaRedColor,
                            title: Text(
                              item.expandedValue,
                              style: const TextStyle(
                                  color: backgroundColorCream1,
                                  fontWeight: FontWeight.w800),
                            ),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    item.expandedValue2,
                                    style:
                                        TextStyle(color: backgroundColorCream1),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Learn more",
                                    style: TextStyle(
                                      color: backgroundColorCream1,
                                      decoration: TextDecoration.underline,
                                      fontSize: 8,
                                      decorationColor: backgroundColorCream1,
                                      decorationThickness: 1,
                                    ),
                                  )
                                ]))
                        : null,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
