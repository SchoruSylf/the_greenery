import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      addUserDetails(
          _usernameController.text.trim(), _emailController.text.trim()
      );
    }
  }

  Future addUserDetails(String username, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthscrn = MediaQuery.of(context).size.width;
    double heightscrn = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(children: [
              Container(
                margin: EdgeInsets.only(
                    top: (heightscrn / 100), left: (widthscrn / 20)),
                child: Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 30.0, left: 20.0, bottom: 0)),
                    Text(
                      "Hello!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ],
                ),
              )
            ]),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                  left: 20.0,
                )),
                Text("Welcome to "),
                Text(
                  "The Greenery",
                  style: TextStyle(
                      fontFamily: 'Belanda', fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              //TOMBOL LOGIN DAN REGISTER
              margin: EdgeInsets.only(top: 30),
              width: 380,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(11)),
                border: Border.all(color: Colors.black),
              ),
            ),
            Container(
              //INPUTAN TEXT
              margin: EdgeInsets.only(top: 30.0),
              width: 370,
              height: 600,
              child: Column(
                children: [
                  Container(
                    //input form
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.email_outlined),
                                    Text(
                                      "  Email",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 5, left: 5),
                              ),
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  hintText: '   example : airexxx@gmail.com',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.account_circle_outlined),
                                    Text(
                                      "  Username",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 5, left: 5),
                              ),
                              TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  hintText: '   min 3 character',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.lock_outlined),
                                    Text(
                                      "  Password",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 5, left: 5),
                              ),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  hintText: '   contains letters and numbers',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.lock_outlined),
                                    Text(
                                      "  Confirm Password",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 5, left: 5),
                              ),
                              TextField(
                                controller: _confirmpasswordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  hintText: '   must same from above',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // FilledButton(
                            //   style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all(
                            //         Color.fromRGBO(0, 2, 0, 1)),
                            //     fixedSize:
                            //         MaterialStateProperty.all(Size(170, 50)),
                            //     shape: MaterialStateProperty.all(
                            //       RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(8)),
                            //     ),
                            //   ),
                            //   onPressed: () {},
                            //   child: Text("Cancel"),
                            // ),
                            FilledButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(170, 60, 34, 1)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 50)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              onPressed: signUp,
                              // onPressed: () {
                              //   setState(() {
                              //     Navigator.pushReplacement(context,
                              //         MaterialPageRoute(builder: (context) {
                              //       return NavBarPage();
                              //     }));
                              //   });
                              // },
                              child: Text("Submit"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
