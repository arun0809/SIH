import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgetpassword.dart';
import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color(0xFFD6D6D6),
                  gradient: LinearGradient(
                      colors: [(new Color(0xFF64B5F6)),(new Color(0xFF01579B))],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset("images/login.png"),
                      height: 310,
                      width: 250,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 10, bottom: 3),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Student Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 310,
              child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        // RaisedButton(
                        //   color: Colors.orange[900],
                        //   textColor: Colors.white,
                        //   shape: RoundedRectangleBorder(
                        //       // side: BorderSide(color: Colors.black, width: 1),
                        //       ),
                        //   onPressed: () {
                        //     Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //         builder: (context) => Forgotpass(),
                        //       ),
                        //     );
                        //   },
                        //   child: Text(
                        //     "Forgot Password ....",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 18,
                        //       decoration: TextDecoration.underline,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          child: Text("Forget Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF303030)
                            ),),
                          onTap: ()=>{
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>ForgetPassword()
                            ))
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            // print("email : ${emailController.text} password: ${passwordController.text}");
                            setState(() {
                              visible = true;
                            });
                            signIn(
                                emailController.text, passwordController.text);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 40, left: 40,top:10),
                            // padding: EdgeInsets.only(left: 20, right: 20),
                            alignment: Alignment.center,
                            height: 54,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors:  [(new Color(0xFF64B5F6)),(new Color(0xFF01579B))],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight
                              ),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE)
                              )],
                            ),
                            child: Text("LOGIN",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have Account? "),
                  GestureDetector(
                    onTap: ()=>{
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context) => Register()
                      ))
                    },
                    child: Text("Register Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF303030)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signIn( String email, String password) async {
    // print("email : $email password: $password");
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,

        );
        print("$userCredential");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
