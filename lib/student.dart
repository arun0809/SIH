import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:picozen_final/student_app_status.dart';
import 'package:picozen_final/student_home.dart';
import 'package:picozen_final/student_homescreen.dart';
import 'package:picozen_final/student_profile.dart';

import 'login.dart';
import 'model.dart';

class Student extends StatefulWidget {
  String id;
  Student({required this.id});
  @override
  _StudentState createState() => _StudentState(id: id);
}

class _StudentState extends State<Student> {
  TextEditingController _fnamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _lnamecontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _branchcontroller = TextEditingController();
  TextEditingController _degreecontroller = TextEditingController();
  TextEditingController _schoolcontroller = TextEditingController();
  TextEditingController _citycontroller = TextEditingController();
  CollectionReference Register = FirebaseFirestore.instance.collection('Register');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return Register
        .add({
      'fname': _fnamecontroller.text, // John Doe
      'lname': _lnamecontroller.text, // Stokes and Sons
      'email': _emailcontroller.text,
      'age': _agecontroller.text,
      'date': _datecontroller.text,
      'branch': _branchcontroller.text,
      'degree': _degreecontroller.text,
      'school': _schoolcontroller.text,
      'city': _citycontroller.text,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _StudentState({required this.id});
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  @override
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                gradient: LinearGradient(
                    colors: [(new Color(0xFF64B5F6)), (new Color(0xFF01579B))],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset("images/profile.png"),
                      height: 310,
                      width: 250,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _fnamecontroller,

                    cursorColor: Color(0xDD000000),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xDD000000),
                          size: 20,
                        ),
                        hintText: "First name",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _lnamecontroller,
                    cursorColor: Color(0xDD000000),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xDD000000),
                          size: 20,
                        ),
                        hintText: "Last name",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _datecontroller,
                    cursorColor: Color(0xDD000000),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.date_range_sharp,
                          color: Color(0xDD000000),
                          size: 20,
                        ),
                        hintText: "Date of birth",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _agecontroller,
                    cursorColor: Color(0xDD000000),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xDD000000),
                          size: 20,
                        ),
                        hintText: "Gender",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _emailcontroller,
                    cursorColor: Color(0xDD000000),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color(0xDD000000),
                          size: 20,
                        ),
                        hintText: "Email Id",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _schoolcontroller,
                    cursorColor: Color(0xDD000000),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.school_sharp,
                          color: Color(0xDD000000),
                          size: 20,
                        ),
                        hintText: "School/Institution name",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 15, 0, 0),
                      height: 49,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE))
                        ],
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                          controller: _degreecontroller,
                        cursorColor: Color(0xDD000000),
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Icon(
                                Icons.save_as_rounded,
                                color: Color(0xDD000000),
                                size: 20,
                              ),
                            ),
                            hintText: "Degree",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: 49,
                      width: 170,
                      margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE))
                        ],
                      ),
                      child: TextField(
                        controller: _branchcontroller,
                        cursorColor: Color(0xDD000000),
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Icon(
                                Icons.vertical_split,
                                color: Color(0xDD000000),
                                size: 20,
                              ),
                            ),
                            hintText: "Branch",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _citycontroller,
                    cursorColor: Color(0xDD000000),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.location_city_rounded,
                          color: Color(0xDD000000),
                          size: 20,
                        ),
                        hintText: "City",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                     addUser(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudentHomeScreen()),
                    ),

                    print("Registered")
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 54,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            (new Color(0xFF64B5F6)),
                            (new Color(0xFF01579B))
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE))
                      ],
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => LoginPage(),
    ),
  );
}
