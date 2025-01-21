import 'package:flutter/material.dart';
import 'package:rosa/pages/home/homepage.dart';
import '../../constants/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> pages = [
    HomePage(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];

  List<Widget> colleges = [

  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Row(
                  children: [
                    Image.asset(
                      rosaIconPath,
                      width: 44,
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
                toolbarHeight: 44,
                backgroundColor: rosaRedColor,
              ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: textFormBorderColor,
        selectedItemColor: rosaRedColor,
        unselectedItemColor: inactiveRedColor,
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Insights",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pages[currentPage],
    );
  }
}