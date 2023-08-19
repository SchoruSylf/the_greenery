import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_greenery/Page/mainpage/HomePage.dart';
import 'package:the_greenery/Page/mainpage/orderpage.dart';
import 'package:the_greenery/page/mainpage/favoritepage.dart';
import 'package:the_greenery/page/mainpage/profilepage.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('plant').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  int _pageIndex = 0;
  final List<Widget> _tablist = [
    HomePage(),
    OrderPage(),
    FavoritePage(),
    ProfilePage()
  ];
  void _onItemTapped(int index) {
    if (index != 1) {
      setState(() {
        _pageIndex = index;
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return OrderPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(children: [
        _tablist.elementAt(_pageIndex),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment(0.0, 0.96),
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color.fromRGBO(35, 61, 77, 1),
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  currentIndex: _pageIndex,
                  onTap: (int index) {
                    setState(() {
                      _pageIndex = index;
                    });
                    _onItemTapped(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_shopping_cart_rounded),
                      label: "Order",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_rounded),
                      label: "Favorite",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      label: "Profile",
                    ),
                  ],
                )),
          ),
        )
      ]),
    ));
  }
}
