import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Row(
                  children: [
                    Image.asset(
                      'assets/icons/rosa_icon.png',
                      width: 74,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 268.0),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ],
                ),
                toolbarHeight: 84,
                backgroundColor: rosaRedColor,
              ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColorCream2,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
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
          ],
        ),
      ),
    );
  }
}