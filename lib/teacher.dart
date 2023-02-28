import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Institution_home.dart';
import 'institution_profile.dart';
import 'institution_student_app.dart';
import 'login.dart';
import 'model.dart';

class Teacher extends StatefulWidget {
  String id;
  Teacher({required this.id});
  @override
  _TeacherState createState() => _TeacherState(id: id);
}

class _TeacherState extends State<Teacher> {
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _TeacherState({required this.id});

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
              title: new Text("Add Events"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => Institution_Home()));
              },
            ),
            new ListTile(
              title: new Text("Today's Submission"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InstitutionStudentApp()));
              },
            ),
            new ListTile(
              title: new Text("Profile Page"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => InstitutionProfile()));
              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("Scanner"),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Text("Hey"),
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
  title: new Text("Add event"),
  onTap: () {
  Navigator.pop(context);
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => Institution_Home()));
  },
  ),
  new ListTile(
  title: new Text("Application Status"),
  onTap: () {
  Navigator.pop(context);
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => InstitutionStudentApp()));
  },
  ),
  new ListTile(
  title: new Text("Profile Page"),
  onTap: () {
  Navigator.pop(context);
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => InstitutionProfile()));
  },
  ),
  ],
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
