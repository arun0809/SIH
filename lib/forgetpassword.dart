import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ForgetPassword> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 370,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color(0xFFD6D6D6),
                  gradient: LinearGradient(colors: [
                    (new Color(0xFF64B5F6)),
                    (new Color(0xFF01579B))
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "images/forgetpass.png",
                        width: 400,
                      ),
                      height: 310,
                      // width: 400,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 10, bottom: 3),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forget Password",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                controller: emailcontroller,
                cursorColor: Color(0xDD000000),
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email_rounded,
                      color: Color(0xDD000000),
                    ),
                    hintText: "Enter Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            GestureDetector(
              onTap: () => {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailcontroller.text)
                    .then((value) => Navigator.of(context).pop())
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 60),
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (new Color(0xFF64B5F6)),
                    (new Color(0xFF01579B))
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

