import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'constants.dart';
import 'package:flutter/rendering.dart';
//////////////////UBUFF

class CollegeProfileUB extends StatefulWidget {
  const CollegeProfileUB({super.key});

  @override
  ProfileUB createState() {
    return ProfileUB();
  }
}
class ProfileUB extends State<CollegeProfileUB>{
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation: 0,
          title:Row(
              children:[
                GestureDetector(
                    onTap: () {
                      context.go('/');
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromRGBO(0, 91, 187,1),
                      size: 32,
                    )
                ),
                Text("University at Buffalo"
                    , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ) //CollegeName will be hard coded for now
              ]
          )
      ),
      body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
                  ParallaxContainer(),
                  Divider(color: Color(0xffbec0cb)),
                  SizedBox(height: 15,),
                  GenericProfileUB(admissionsData: ["lol", "lol", "lol", "lol", "lol" ,"lol", "lol" ,"lol"],),
                  SizedBox(height:20,),
                ]
            ),
          )
      ),
    );

  }


}

class GenericProfileUB extends StatelessWidget{
  const GenericProfileUB({
    super.key,
    required this.admissionsData,
  });

  final List admissionsData;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            collegeSynopsisBlock(context),
            admissionsBlock( context , admissionsData),
            costsBlock(context),
            academicsBlock(context,),
            studentsBlock(context),
            beyondCollegeBlock(context)
          ],
        )
    );
    // TODO: implement build
  }

  Widget collegeSynopsisBlock(BuildContext context){
    return Stack(
        children : [
          Card.outlined(
            color: Color(0xfff3fcfa),
            shape: RoundedRectangleBorder(
              side:BorderSide(
                  width:1,
                  color: Color(0xffe3e3d2)
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5.0),
              ),
            ),

            child: Container(
                width:MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "University at Buffalo",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                        )
                      ],
                    ),
                    Divider(
                        color: Color(0xffe3e3d2)
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          width: MediaQuery.of(context).size.width *.45,
                          child: Text(
                              'Your future comes to life when you set foot on the campus that will become your college home. Complete your application to Reed College by Jan 15, visit campus between Jan 15 and April 15, and enroll at Reed to receive a one time \$1,000 credit towards your first-year Ubuff tuition. We think experiencing life at UBuff in person is just that important.'


                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
          ),

          // Contact Info
          Positioned(
              top:MediaQuery.of(context).size.height * 0.075,
              right: 10,
              child: Card.outlined(
                color: Color(0xfff3fcfa),
                shape: RoundedRectangleBorder(
                  side:BorderSide(
                      width:1,
                      color: Color(0xffd0c6bc)
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0),
                  ),
                ),
                child: Container(
                  width:MediaQuery.of(context).size.width * .4,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              Icons.language,
                              size: 16,
                              color: Color(0xffb0929c)
                          ),
                          SizedBox(width: 2,),
                          Text("reed.edu")
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                                Icons.mail,
                                size: 16,
                                color: Color(0xffb0929c)
                            ),
                            SizedBox(width: 2,),
                            Container(
                              width:MediaQuery.of(context).size.width * .25,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("admissions@ reed.edu")
                                  ]
                              ),
                            ),
                          ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                              Icons.location_on,
                              size: 16,
                              color: Color(0xffb0929c)
                          ),
                          SizedBox(width: 2,),
                          Container(
                              width:MediaQuery.of(context).size.width * .25,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("3203 SE WOODSTOCK BLVD PORTLAND, OR 97202")
                                  ]
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
          ),  // Admissions
        ]
    );
  }

  Widget admissionsBlock(BuildContext context, List data ){
    return Card.outlined(
      color: Color(0xfff3fcfa),
      shape: RoundedRectangleBorder(
        side:BorderSide(
            width:1,
            color: Color(0xffe3e3d2)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0),
        ),
      ),
      child: Container(
          width:MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "Admissions",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Divider(
                  color : Color(0xffe3e3d2)
              ),
              Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                            "Application Deadline",
                            style: TextStyle(fontSize: 20)
                        ),
                      ),

                      Spacer(),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("January 15",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      )

                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Acceptance Rate",
                              style: TextStyle(fontSize: 16)
                          ),
                          Text(
                              "30%",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                        ],
                      ),

                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              "Application Fee",
                              style: TextStyle(fontSize: 16)
                          ),
                          Text(
                              "\$0",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 5,),
                  //I am hardcoding this misc section
                  Divider(color : Color(0xffe3e3d2)),
                  Row(
                    children: [
                      Text("SAT Range"),
                      Spacer(),
                      Text("1320 - 1500", ),
                    ],
                  ),
                  Divider(color : Color(0xffe3e3d2)),

                  Row(
                    children: [
                      Text("ACT Range"),
                      Spacer(),
                      Text("30 - 33", ),
                    ],
                  ),
                  Divider(color : Color(0xffe3e3d2)),

                  Row(
                    children: [
                      Text("SAT/ACT"),
                      Spacer(),
                      Text("Considered but not required", ),
                    ],
                  ),
                  Divider(color : Color(0xffe3e3d2)),

                  Row(
                    children: [
                      Text("High School GPA"),
                      Spacer(),
                      Text("Required", ),
                    ],
                  ),
                  Divider(color : Color(0xffe3e3d2)),

                  Row(
                    children: [
                      Text("Early Decision/Early Action"),
                      Spacer(),
                      Text("Yes", ),
                    ],
                  ),
                  Divider(color : Color(0xffe3e3d2)),

                  Row(
                    children: [
                      Text("Accepts Common App"),
                      Spacer(),
                      Text("Yes", ),
                    ],
                  ),
                  Divider(color : Color(0xffe3e3d2)),
                ],
              )
            ],
          )
      ),
    );
  }

  Widget costsBlock(BuildContext context){
    return Card.outlined(
      color: Color(0xfff3fcfa),
      shape: RoundedRectangleBorder(
        side:BorderSide(
            width:1,
            color: Color(0xffe3e3d2)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0),
        ),
      ),

      child: Container(
        width:MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "Costs",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )
              ],
            ),
            Divider(color : Color(0xffe3e3d2)),
            IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Net Cost",
                                style: TextStyle(fontSize: 16)),
                            Text("\$33,106",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      VerticalDivider(
                          width: 5,
                          color : Color(0xffe3e3d2)
                      ),

                      IntrinsicWidth(
                          child:Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Average Total Aid Awarded",
                                  style: TextStyle(fontWeight: FontWeight.w100),
                                ),
                                Text("\$47,864"),

                                Divider(
                                    color : Color(0xffe3e3d2)
                                ),
                                Text("Students Recieving Financial Aid"),
                                Text("64%"),
                              ],
                            ),
                          )
                      )
                    ]

                )
            )
          ],
        ),
      ),
    );
  }

  Widget academicsBlock(BuildContext context){
    return Card.outlined(
      color: Color(0xfff3fcfa),
      shape: RoundedRectangleBorder(
        side:BorderSide(
            width:1,
            color: Color(0xffe3e3d2)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0),
        ),
      ),

      child: Container(
        width:MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "Academics",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )
              ],
            ),
            Divider(color : Color(0xffe3e3d2)),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Most Popular Majors",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                      IntrinsicWidth(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color : Color(0xffe3e3d2)),
                              Text("Political Science and Government"),
                              Divider(color : Color(0xffe3e3d2)),
                              Text("Research and Experimental Psychology"),
                              Divider(color : Color(0xffe3e3d2)),
                              Text("English")

                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                )

              ],
            ),
            Divider(color : Color(0xffe3e3d2)),
            // Grid Like Structure
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  IntrinsicHeight(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Graduation Rate",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16 , )),
                                Text("80%",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              ],

                            ),
                          ),
                          VerticalDivider(color : Color(0xffe3e3d2)),
                          Flexible(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Full-Time Retention Rate",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16 , )),
                                Text("86%",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              ],

                            ),
                          ),
                        ],
                      )
                  ),
                  Divider(color : Color(0xffe3e3d2)),
                  IntrinsicHeight(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Student Faculty Ratio",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16 , )),
                                Text("8 : 1",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              ],

                            ),
                          ),
                          VerticalDivider(color : Color(0xffe3e3d2)),
                          Flexible(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Average Class Size",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16 , )),
                                Text("16",
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              ],

                            ),
                          ),
                        ],
                      )
                  )
                  ,



                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  // TO DO
  Widget studentsBlock(BuildContext context){
    return Card.outlined(
      color: Color(0xfff3fcfa),
      shape: RoundedRectangleBorder(
        side:BorderSide(
            width:1,
            color: Color(0xffe3e3d2)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0),
        ),
      ),

      child: Container(
        width:MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    "Students",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                )
              ],
            ),
            Divider(color : Color(0xffe3e3d2)),

            Container(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full-Time Enrollment",
                          style: TextStyle(fontSize: 16)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("1,404",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(width: 6),
                          Padding(
                            padding: const EdgeInsets.only(bottom:5.0),
                            child: Text("Undergraduates",
                                style: TextStyle(fontSize: 12,  color: Color(0xffb0929c))),
                          ),

                        ],
                      )

                    ],
                  )

                ],
              ),
            ),
            Divider(color : Color(0xffe3e3d2)),

            // Race Diversity
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8, bottom: 8),
                        child: Text("Racial Diversity",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200)
                        ),
                      ),
                      Container(
                        width:MediaQuery.of(context).size.width,
                        color: Color(0xffeef2e8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("African American"),
                                    Text("5%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Asian"),
                                    Text("15%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Hispanic"),
                                    Text("10%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("International (Non-Citizen)"),
                                    Text("8%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Multiracial"),
                                    Text("0%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Native American"),
                                    Text("2%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Pacific Islander"),
                                    Text("0%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Unknown"),
                                    Text("2%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("White"),
                                    Text("59%"),
                                  ]
                              ),

                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                )

              ],
            ),
            // Gender Diversity
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8, bottom: 8),
                        child: Text("Gender Share",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200)
                        ),
                      ),

                      Container(
                        width:MediaQuery.of(context).size.width,
                        color: Color(0xffeef2e8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Female Undergrads"),
                                    Text("45%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Male Undergrads"),
                                    Text("33%"),
                                  ]
                              ),
                              Divider(color : Color(0xffd0c6bc)),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Non-Binary Undergrads"),
                                    Text("22%"),
                                  ]
                              ),

                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                )

              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget beyondCollegeBlock(BuildContext context ){
    return Card.outlined(
      color: Color(0xfff3fcfa),
      shape: RoundedRectangleBorder(
        side:BorderSide(
            width:1,
            color: Color(0xffe3e3d2)
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0),
        ),
      ),
      child: Container(
          width:MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "Beyond College",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Divider(
                  color : Color(0xffe3e3d2)
              ),
              Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Median Earnings 6 years after Graduation"),
                            Text("\$42,200",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("National",
                            style: TextStyle(color: Color(0xffb0929c),fontSize: 12),),
                          Text("\$33,028",
                              style: TextStyle(color: Color(0xffb0929c),fontSize: 14)),

                        ],
                      )

                    ],
                  ),
                  Divider(color : Color(0xffe3e3d2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Employed 2 years after Graduation"),
                            Text("88%",
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("National",
                            style: TextStyle(color: Color(0xffb0929c),fontSize: 12),),
                          Text("83%",
                              style: TextStyle(color: Color(0xffb0929c),fontSize: 14)),

                        ],
                      )

                    ],
                  ),

                ],
              )
            ],
          )
      ),
    );
  }

}



class ParallaxContainer extends StatelessWidget{
  const ParallaxContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationListItem(
          imageUrl: "assets/images/reed_spring.jpg",
        ),
      ],

    );

  }


}

class StudentInsights extends StatelessWidget{
  const StudentInsights({
    super.key,
    required this.data,
  });

  final List data;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Color.fromRGBO(0, 91, 187,1),
      shape: RoundedRectangleBorder(
        side:BorderSide(
            width:1,
            color: Color.fromARGB(255, 7,43,75)
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(0.0),
        ),),

      child:Container(
        width: (MediaQuery.of(context).size.width < 800) ? MediaQuery.of(context).size.width * .4 : 320,
        padding: const EdgeInsets.all(12.0),

        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Your Insights",
                    style: TextStyle( fontWeight:FontWeight.bold,fontSize:12,color: Colors.white,)),
              ],
            ),
            Divider(color: Color(0xff6c565c)),
            Container(
              padding: const EdgeInsets.only(left:4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for(var dataBit in data)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                            Icons.star_rounded,
                            color: Color(0xff6c565c),
                            size: 16),

                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child:
                            Text( dataBit ,
                              textAlign: TextAlign.center ,
                              style: TextStyle( fontSize:16,color: Colors.white,),
                            ),
                          ),
                        ),

                      ],
                    )
                ],
              ),
            )




          ],
        )

        ,
      ),

    );
  }
}

class ExecutiveSummary extends StatelessWidget{
  const ExecutiveSummary({
    super.key,
    required this.data,
  });

  final List data;
  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        color: Color.fromRGBO(0, 91, 187,1),
        shape: RoundedRectangleBorder(
          side:BorderSide(
              width:1,
              color: Color.fromARGB(255, 7,43,75)
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(00.0),
            bottomLeft: Radius.circular(15.0),
          ),),

        child:Container(
          decoration: BoxDecoration(

          ),
          width: (MediaQuery.of(context).size.width < 800) ? MediaQuery.of(context).size.width * .75 : 600,

          padding: const EdgeInsets.all(12.0),
          child: Flexible(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for(var dataBit in data)
                  Text(dataBit + "\n", style: TextStyle( fontSize:16,color: Colors.white,),),
              ],
            )

            ,
          ),
        )
    );
  }
}

class CollegeMantra extends StatelessWidget{
  const CollegeMantra({
    super.key,
    required this.mantra,
  });

  final String mantra;
  @override

  Widget build(BuildContext context) {
    return Container(

      width: (MediaQuery.of(context).size.width < 800) ? MediaQuery.of(context).size.width * .75 : 600,

      padding : EdgeInsets.only(left:15.0,top: 5.0, bottom:5.0),
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(width: 2 ,color: Color.fromRGBO(0, 91, 187,1),)
        ),
      ),
      child: Stack(
          children: [
            Text(mantra ,
              textAlign: TextAlign.left,
              style: GoogleFonts.spectral(
                fontSize: 30,
                fontWeight: FontWeight.bold ,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Color.fromARGB(90, 82, 25, 39),
              ),
            ),

            Text(mantra ,
              textAlign: TextAlign.left,
              style: GoogleFonts.spectral(
                  fontSize: 30,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold
              ),
            ),
          ]
      ),

    );
  }
}

@immutable
class LocationListItem extends StatelessWidget {
  LocationListItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      child: AspectRatio(
        aspectRatio:  screenWidth/ (screenHeight*1.25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
          scrollable:Scrollable.of(context),
          listItemContext:context,
          backgroundImageKey: _backgroundImageKey

      ),
      children: [
        Image.asset(
            imageUrl,
            fit: BoxFit.fill,
            key: _backgroundImageKey
        ),
        Text("lol")
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(75, 0,0 ,0), Color.fromARGB(75,0,0 ,0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 1],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            SizedBox(height: screenHeight * .05,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  SizedBox(width: screenWidth * 0.05,),
                  CollegeMantra(mantra: "Think deeply, enjoy the challenge, and explore thoughtfully at Reed College.")
                ]
            ),
            Spacer(),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  SizedBox(width: screenWidth * 0.05,),
                  StudentInsights(data: ["74K Avg COA", "1:8 S-F Ration", "Pop. 1400", "Open Crclm"])
                ]
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ExecutiveSummary(data:
                [
                  "Reed is a coeducational, independent liberal arts and sciences college in Southeast Portland, Oregon",
                  "It is referred to as one of the most intellectual colleges in the country and is known for its high standards of scholarly practice, creative thinking, and engaged citizenship."
                ],
                ),
                SizedBox(width:(screenWidth * .05))
              ],
            ),
            SizedBox(height: screenHeight * .05,)
          ]
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }): super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      height: constraints.maxHeight *1.2,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
    (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
    verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
      Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}