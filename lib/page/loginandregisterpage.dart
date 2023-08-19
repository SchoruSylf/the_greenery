import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_greenery/page/login/loginpage.dart';
import 'package:the_greenery/page/login/registerpage.dart';

class LoginAndRegisterPage extends StatefulWidget {
  const LoginAndRegisterPage({super.key});

  @override
  State<LoginAndRegisterPage> createState() => _LoginAndRegisterPageState();
}

class _LoginAndRegisterPageState extends State<LoginAndRegisterPage> {
  int _pageIndex = 0;
  final List<Widget> _tablist = [LoginPage(), RegisterPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(children: [
        _tablist.elementAt(_pageIndex),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            heightFactor: 4.7,
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: const Color.fromRGBO(2, 2, 2, 1),
                  unselectedItemColor: const Color.fromRGBO(2, 2, 2, 1),
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  currentIndex: _pageIndex,
                  onTap: (int index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.login_outlined),
                      label: "Login",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_add_alt_1), label: "Register"),
                  ],
                )),
          ),
        )
      ]),
    ));
  }
}
