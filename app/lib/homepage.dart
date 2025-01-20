import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Row(
                  children: [
                    Image.asset(
                      'assets/icons/rosa_icon.png',
                      width: 44,
                      alignment: Alignment.centerLeft,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 268.0),
                    //   child: Icon(
                    //     Icons.settings,
                    //     color: Colors.white,
                    //     size: 64,
                    //   ),
                    // ),
                  ],
                ),
                toolbarHeight: 44,
                backgroundColor: rosaRedColor,
              ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentPage = value;
        },
        backgroundColor: backgroundColorCream2,
        selectedItemColor: rosaRedColor,
        unselectedItemColor: inactiveRedColor,
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.lightbulb),
          //   label: "Insights",
          // ),
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
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              }, 
              child: const Text('Go to Login'),
              
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/intakes');
              },
              child: const Text('Go to Intakes'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/testcollege_profile');
              },
              child: const Text('Go to College Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/MatchPage1State');
              },
              child: const Text('Go to Match'),

            ),
          ],
        ),
      ),
    );
  }
}