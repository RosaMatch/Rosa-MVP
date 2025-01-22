import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
              child: SizedBox(
                height: 70,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: textFormBorderColor,
                      width: 1,
                    )
                  ),
                  color: Colors.white,

                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(juniorPfpPath),
                        radius: 31,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Welcome Aboard, Junior!',
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
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
                                date: '1/15',
                                iconRoute: 'assets/icons/hunter_icon.jpg',
                                collegeName: 'CUNY Hunter College',
                              ),

                              UpdateCard(
                                alertType: 'Undergrad Deadline',
                                date: '1/15',
                                iconRoute: 'assets/icons/ubuff_icon.jpg',
                                collegeName: 'University of Buffalo',
                              ),
                            ]
                          )
                        )
                      )
                    ),
                  ],
                )
              )
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: Container(
                height: 220,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: textFormBorderColor,
                      width: 1,
                    )
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Agenda',
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
                                AgendaCard(
                                  imagePath: 'assets/images/introductionAgendaPicture.jpg',
                                  title: 'Introduction'
                                ),

                                AgendaCard(
                                  imagePath: 'assets/images/myCollegeFit.jpg',
                                  title: 'My College Fit',
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: Container(
                height: 220,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: textFormBorderColor,
                      width: 1,
                    )
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Your Matches',
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
                                  imagePath: 'assets/images/reed.jpg',
                                  name: 'Reed College',
                                  route: testCollegeProfileRoute,
                                ),

                                CollegeCard(
                                  imagePath: 'assets/images/wesleyan.jpg',
                                  name: 'Wesleyan College',
                                  route: wesProfileRoute,
                                ),

                                CollegeCard(
                                  imagePath: 'assets/images/hunterCollegeGobrrrbeepbeep.jpg',
                                  name: 'CUNY Hunter College',
                                  route: hunterProfileRoute,
                                ),

                                CollegeCard(
                                  imagePath: 'assets/images/handsUbuff.jpg',
                                  name: 'University of Buffalo',
                                  route: uBuffProfileRoute,
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

            ),
            ElevatedButton(
              onPressed: () {
                context.go('/H_profile');
              },
              child: const Text('Go to Hunter'),

            )

          ],
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

class AgendaCard extends StatelessWidget {
  const AgendaCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  final String imagePath;
  final String title;

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
                  border: Border.all(
                    color: inactiveRedColor,
                    width: 2,
                  )
                  //borderRadius: BorderRadius.circular(25),
                ),
              ),

              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                ),
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                    color: Colors.white,
                    border: Border.all(
                      color: inactiveRedColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                      left: 5,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Text(
                      title,
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
                      //context.go(route);
                    },
                    splashColor: rosaRedSplashColor,
                  )
                )
              )
            ],
      ),
    );
  }

}