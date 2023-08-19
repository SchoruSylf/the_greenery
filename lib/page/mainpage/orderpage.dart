import 'package:flutter/material.dart';
import 'package:the_greenery/add-ons/separator.dart';
import 'package:the_greenery/page/bottomnav.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: const Color.fromRGBO(35, 61, 77, 1),
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(left: 20, right: 95),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return NavBarPage();
                        }));
                      },
                      icon: Icon(
                        Icons.keyboard_backspace_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black))),
                child: Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Item"),
                          Text("Rp."),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Item"),
                          Text("Rp."),
                        ],
                      ),
                      Container(
                        width: 370,
                        child: MySeparator(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping Cost"),
                          Text("Rp."),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Order"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(97, 155, 138, 1),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
