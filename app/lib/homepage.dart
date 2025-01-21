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