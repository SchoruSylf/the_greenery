import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              child: Align(
                alignment: Alignment(0.0, 2),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.black)),
                        //child:  key Image,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    user.email!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Alamat",
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 370,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.location_on_sharp,
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          title: Text("data"),
                          subtitle: Text("data"),
                          trailing: Icon(Icons.navigate_next),
                          onTap: () {},
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.location_on_sharp,
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          title: Text("data"),
                          subtitle: Text("data"),
                          trailing: Icon(Icons.navigate_next),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 300),
                  ),
                  MaterialButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    color: Color.fromRGBO(170, 60, 34, 1),
                    child: Text("Sign Out", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    ));
  }
}
