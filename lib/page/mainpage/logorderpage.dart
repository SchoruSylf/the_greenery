import 'package:flutter/material.dart';
import 'package:the_greenery/add-ons/separator.dart';
import 'package:the_greenery/page/bottomnav.dart';

class LogOrderPage extends StatefulWidget {
  const LogOrderPage({super.key});

  @override
  State<LogOrderPage> createState() => _LogOrderPageState();
}

class _LogOrderPageState extends State<LogOrderPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
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
                      margin: EdgeInsets.only(left: 20, right: 55),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
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
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      "My Orders",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 40,
                  width: 370,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //Plant type/filter
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 34,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: OutlinedButton.icon(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  iconColor:
                                      MaterialStateProperty.all(Colors.yellow),
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.star),
                                label: Text("Order History"),
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 34,
                              width: 156,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: OutlinedButton.icon(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  iconColor:
                                      MaterialStateProperty.all(Colors.yellow),
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.star),
                                label: Text("In the Process"),
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 34,
                              width: 132,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: OutlinedButton.icon(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  iconColor:
                                      MaterialStateProperty.all(Colors.yellow),
                                ),
                                onPressed: () {},
                                icon: Icon(Icons.star),
                                label: Text("In Delivery"),
                              )),
                        ],
                      )),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        //Output filter di atas
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 170,
                          width: 370,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      //image
                                      height: 75,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 16,
                                  child: const MySeparator(
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Product"),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text("Total: "),
                                          Text(
                                            "Rp. 0.000,-",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    97, 155, 138, 1),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
