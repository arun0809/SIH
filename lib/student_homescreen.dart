import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:picozen_final/student_app_status.dart';
import 'package:picozen_final/student_home.dart';
import 'package:picozen_final/student_profile.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: Text('Scanner App'),
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            new ListTile(
              title: new Text("Home Page"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentHome()));
              },
            ),
            new ListTile(
              title: new Text("Today's Submission"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentappStatus()));
              },
            ),
            new ListTile(
              title: new Text("Profile Page"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentProfile()));
              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("Scanner"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1565c0),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 65, 0, 3),
                    child: Text(
                      'HELLO, KISHORE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 13, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: SizedBox(
                        width: 310,
                        height: 40,
                        child: TextField(
                          cursorColor: Color(0xDD000000),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: Color(0xDD000000),
                              ),
                              hintText: "Search",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 33, 0, 0),
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 220.0,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 450,
                      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 30, 0, 0),
              child: Text(
                'Top picks',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              width: 350,
              margin: EdgeInsets.fromLTRB(22, 20, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),
            Container(
              height: 150,
              width: 350,
              margin: EdgeInsets.fromLTRB(22, 20, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),
            Container(
              height: 150,
              width: 350,
              margin: EdgeInsets.fromLTRB(22, 20, 0, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerCodeOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: Text('Smart Education'),
            decoration: new BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          new ListTile(
            title: new Text("Home Page"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentHome()));
            },
          ),
          new ListTile(
            title: new Text("Application Status"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentappStatus()));
            },
          ),
          new ListTile(
            title: new Text("Profile Page"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentProfile()));
            },
          ),
        ],
      ),
    );
  }
}
