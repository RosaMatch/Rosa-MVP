import 'package:flutter/material.dart';
import 'constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/icon/rosa_icon.png',
              width: 74,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 268.0),
              child: Icon(Icons.settings,
                color: Colors.white,
                size: 64,
                ),
            )
            
          ],
        ),
        toolbarHeight: 84,
        backgroundColor: rosaRedColor,
      ),
      body: const Center(
        child: Column(
          children: [
            
          ]
        )
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: navigationBarColor,
          selectedItemColor: rosaRedColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "List"
            ),
          ],
          onTap: (value) {
            
          },
        )

      // BottomAppBar(
        
      //   shape: const CircularNotchedRectangle(),
      //   color: navigationBarColor,
      //   height: 84,
      //   child: SizedBox(
      //     child: Row(
      //       children: [
      //         IconButton(
      //           icon: const Icon(
      //             Icons.home,
      //             color: rosaRedColor,
      //           ),
      //           onPressed: () {
      //             print("Hello!");
      //           },
      //         )
      //       ]
      //     )
      //   )
      // )
      )
    );
  }
}