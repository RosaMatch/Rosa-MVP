import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'constants.dart';

// For college profile Ui, the information cannot be hardcoded so I will try to make this as general as possible

// There are two sections of the college profile

// The Trading Card which has parallax

// The generic which is standard
class CollegeProfile extends StatefulWidget {
  const CollegeProfile({super.key});

  @override
  Profile createState() {
    return Profile();
  }
}
class Profile extends State<CollegeProfile>{

  Widget build(BuildContext context){
    return Scaffold(
      body:Center()
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
    return Card(
      color: Color.fromARGB(50, 82,25,39),
      child:ListView(
        children:[
          Text( 'Your Insights' ),
          for(var dataBit in data)
            ListTile(
              title:Text(dataBit)
            )
        ]
      )
    );
  }
}
