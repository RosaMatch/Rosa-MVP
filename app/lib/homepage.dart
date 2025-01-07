import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppBar(
              title: Row(
                children: [
                  Image.asset(
                    'assets/icon/rosa_icon.png',
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