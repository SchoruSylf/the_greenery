import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_greenery/page/login/forgetpasswordpage.dart';
import 'package:the_greenery/page/mainpage/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                Text("Welcome back to "),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ForgetPasswordPage();
                                  }));
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                ),
                              ),
                            )
                          ],
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
                                    Color.fromRGBO(97, 155, 138, 1)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(170, 50)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: signIn,
                              // onPressed: () {
                              //   setState(() async {
                              //     Navigator.pushReplacement(context,
                              //         MaterialPageRoute(builder: (context) {
                              //       return NavBarPage();
                              //     }));
                              //   });
                              // },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 18),
                              ),
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
