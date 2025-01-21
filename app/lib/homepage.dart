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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Container(
                height: 70,
                //width: 317,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.white,

                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/juniorpfp.png'),
                        radius: 31,
                      ),
                      // Image.asset(
                      //   'assets/images/juniorpfp.png',
                      //   height: 64,
                      //   width: 64,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Welcome Back, Junior',
                          style: TextStyle(
                            color: rosaRedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          //selectionColor: rosaRedColor
                        ),
                      ),
                    ]
                  )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                color: rosaRedColor,
                indent: 60,
                endIndent: 60,
              ),
            ),
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
            ElevatedButton(
              onPressed: () {
                context.go('/UB_profile');
              },
              child: const Text('Go to Ubuff'),

            ),
            ElevatedButton(
              onPressed: () {
                context.go('/WES_profile');
              },
              child: const Text('Go to WES'),

            )

          ],
        ),
      ),
    );
  }
}