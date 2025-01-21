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
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Container(
                height: 70,
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
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Welcome Back, Junior',
                          style: TextStyle(
                            color: rosaRedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
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

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(
                      color: rosaRedColor,
                      
                    )
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Upcoming Dates',
                          style: TextStyle(
                            color: rosaRedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Container(
                          color: textFormBorderColor,
                          height: 80,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              children: [
                                UpdateCard(
                                  alertType: 'Early Decision',
                                  date: '11/15',
                                  iconRoute: 'assets/icons/reed_icon.png',
                                  collegeName: 'Reed College',
                                ),

                                UpdateCard(
                                  alertType: 'Early Decision',
                                  date: '11/15',
                                  iconRoute: 'assets/icons/wesleyan_icon.png',
                                  collegeName: 'Wesleyan University',
                                ),

                                UpdateCard(
                                  alertType: 'Undergrad Deadline',
                                  date: '2/1',
                                  iconRoute: 'assets/icons/hunter_icon.jpg',
                                  collegeName: 'CUNY Hunter College',
                                ),
                              ]
                            )
                          )
                        )
                      ),

                    ],
                  )
                )
              )
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                height: 220,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Explore Further',
                          style: TextStyle(
                            color: rosaRedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ),
                      
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          color: textFormBorderColor,
                          height: 140,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              children: [
                                CollegeCard(
                                  imagePath: 'assets/images/wesleyan.jpg',
                                  name: 'Wesleyan College',
                                  route: testCollegeProfileRoute,
                                ),

                                CollegeCard(
                                  imagePath: 'assets/images/reed.jpg',
                                  name: 'Reed College',
                                  route: testCollegeProfileRoute,
                                ),

                                CollegeCard(
                                  imagePath: 'assets/images/hunterCollegeGobrrrbeepbeep.jpg',
                                  name: 'CUNY Hunter College',
                                  route: testCollegeProfileRoute,
                                ),

                                CollegeCard(
                                  imagePath: 'assets/images/handsUbuff.jpg',
                                  name: 'University of Buffalo',
                                  route: testCollegeProfileRoute,
                                ),
                              ]
                            )
                          )
                        )
                      ),

                    ],
                  )
                )
              )
            ),

            ElevatedButton(
              onPressed: () {
                context.push('/login');
              }, 
              child: const Text('Go to Login'),
              
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/intakes');
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
                context.push('/MatchPage1State');
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


// TO DO: Currently, the InkWell is drawn at the end of the stack. In the future,
// refactoring to make this more readable may be needed.
class CollegeCard extends StatelessWidget {
  const CollegeCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.route,
  });
  
  final String name;
  final String imagePath;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
            children: [

              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                ),
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                      left: 5,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: rosaRedColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 150,
                width: 150,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.go(route);
                    },
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    splashColor: rosaRedSplashColor,
                  )
                )
              )
            ],
      ),
    );
  }
}

class UpdateCard extends StatelessWidget {
  
  const UpdateCard({
    super.key,
    required this.alertType,
    required this.date,
    required this.iconRoute,
    required this.collegeName,
  });

  final String alertType;
  final String date;
  final String iconRoute;
  final String collegeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:5, horizontal: 1),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(iconRoute),
              radius: 26
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 2, left: 5, right: 15),
                  child: Text(
                    collegeName,
                    style: TextStyle(
                      color: backgroundColorCream2,
                      fontSize: 12,
                    )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 5, right: 15),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: alertType,

                        ),
                        TextSpan(
                          text: ' | ',
                        ),
                        TextSpan(
                          text: date,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    )
                  )
                )
              ]
            ),
          ]
        )
      )
    );
  }
}