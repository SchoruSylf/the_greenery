import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:the_greenery/add-ons/getname.dart';
import 'package:the_greenery/add-ons/gettype.dart';
import 'package:the_greenery/page/mainpage/logorderpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<ListResult> futureFiles;
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('plant').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }


  @override
  void initState() {
    getDocId();
    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                      Text(
                        'Hello, ' + user.email!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton.outlined(
                                onPressed: () {},
                                icon: Icon(Icons.notifications_none_outlined)),
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LogOrderPage();
                                  }));
                                },
                                icon: Icon(Icons.shopping_bag_outlined)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 9,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //genre item
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 50,
                        width: 360,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder(
                            future: getDocId(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      //filtered item
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 200,
                        width: 360,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder(
                            future: getDocId(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: docIDs.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Material(
                                                    child: Text("Rp. 12.000"),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.greenAccent,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GetType(
                                                          documentID:
                                                              docIDs[index]),
                                                      GestureDetector(
                                                        child: Icon(Icons
                                                            .favorite_border),
                                                        onTap: () {
                                                          Icon(Icons
                                                              .ac_unit_rounded);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 4),
                                                      width: 140,
                                                      child: GetName(
                                                          documentID:
                                                              docIDs[index])),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      //all product
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        width: 360,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  height: 50,
                                  width: 340,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(97, 155, 138, 1),
                                    border: Border.all(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "All Product",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                              //grid product
                              Container(
                                child: FutureBuilder(
                                  future: getDocId(),
                                  builder: (context, snapshot) {
                                    return GridView.builder(
                                      physics: ScrollPhysics(),
                                      itemCount: docIDs.length,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 20,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Container(
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Material(
                                                          child: Text(
                                                              "Rp. 12.000"),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors
                                                              .greenAccent,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10, right: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GetType(
                                                                documentID:
                                                                    docIDs[
                                                                        index]),
                                                            Icon(Icons
                                                                .favorite_border)
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 3),
                                                              width: 153,
                                                              child: GetName(
                                                                  documentID:
                                                                      docIDs[
                                                                          index]))
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Expanded(flex: 1, child: Container())
        ],
      ),
    ));
    // return MaterialApp(
    //   home: Scaffold(
    //     body: Column(
    //       children: [
    //         Expanded(
    //           flex: 3,
    //           child: Container(
    //             margin: EdgeInsets.only(top: 20),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Container(
    //                       width: 43,
    //                       height: 43,
    //                       decoration: BoxDecoration(
    //                           border: Border.all(color: Colors.black),
    //                           borderRadius: BorderRadius.circular(20)),
    //                       child: Container(
    //                         padding: EdgeInsets.all(20),
    //                       ),
    //                     ),
    //                     Text(
    //                       'Hello, ' + user.email!,
    //                       style: TextStyle(fontWeight: FontWeight.bold),
    //                     ),
    //                     Container(
    //                       child: Row(
    //                         children: [
    //                           IconButton.outlined(
    //                               onPressed: () {},
    //                               icon:
    //                                   Icon(Icons.notifications_none_outlined)),
    //                           IconButton(
    //                               onPressed: () {
    //                                 Navigator.pushReplacement(context,
    //                                     MaterialPageRoute(builder: (context) {
    //                                   return LogOrderPage();
    //                                 }));
    //                               },
    //                               icon: Icon(Icons.shopping_bag_outlined)),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //                 Container(
    //                   margin: EdgeInsets.only(left: 20, right: 20),
    //                   decoration: BoxDecoration(
    //                       border: Border.all(color: Colors.black),
    //                       borderRadius: BorderRadius.circular(15)),
    //                   padding: EdgeInsets.only(left: 20, right: 20),
    //                   child: TextField(
    //                     style: TextStyle(),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 9,
    //           child: Container(
    //             height: 600,
    //             width: double.infinity,
    //             decoration: BoxDecoration(
    //               border: Border(top: BorderSide(color: Colors.black)),
    //             ),
    //             child: SingleChildScrollView(
    //               scrollDirection: Axis.vertical,
    //               child: Container(
    //                 margin: EdgeInsets.only(top: 20),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       width: 370,
    //                       child: Container(
    //                         child: SingleChildScrollView(
    //                           child: Column(
    //                             mainAxisSize: MainAxisSize.min,
    //                             children: [
    //                               SizedBox(
    //                                 height: 40,
    //                                 child: ListView.builder(
    //                                   itemCount: 4,
    //                                   scrollDirection: Axis.horizontal,
    //                                   itemBuilder: (context, index) => Padding(
    //                                     padding: const EdgeInsets.all(3.0),
    //                                     child: GestureDetector(
    //                                       onTap: () {
    //                                         print("terklik");
    //                                       },
    //                                       child: Container(
    //                                           height: 180,
    //                                           width: 140,
    //                                           decoration: BoxDecoration(
    //                                               border: Border.all(
    //                                                   color: Colors.black),
    //                                               borderRadius:
    //                                                   BorderRadius.all(
    //                                                       Radius.circular(10))),
    //                                           child: Column(
    //                                             children: [],
    //                                           )),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),

    //                     //Output filter di atas
    //                     Container(
    //                       margin: EdgeInsets.only(top: 20),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(15),
    //                           border: Border.all(color: Colors.black)),
    //                       width: 370,
    //                       child: SingleChildScrollView(
    //                         child: Column(
    //                           mainAxisSize: MainAxisSize.min,
    //                           children: [
    //                             SizedBox(
    //                               height: 220,
    //                               child: ListView.builder(
    //                                 itemCount: docIDs.length,
    //                                 scrollDirection: Axis.horizontal,
    //                                 itemBuilder: (context, index) => Padding(
    //                                   padding: const EdgeInsets.all(8.0),
    //                                   child: Container(
    //                                       height: 180,
    //                                       width: 140,
    //                                       decoration: BoxDecoration(
    //                                           border: Border.all(
    //                                               color: Colors.black),
    //                                           borderRadius: BorderRadius.all(
    //                                               Radius.circular(10))),
    //                                       child: Column(
    //                                         children: [
    //                                           Container(
    //                                             child: Column(
    //                                               children: [
    //                                                 Container(
    //                                                     //gambar
    //                                                     ),
    //                                                 Container(
    //                                                   height: 120,
    //                                                   decoration: BoxDecoration(
    //                                                       border: Border(
    //                                                     bottom: BorderSide(
    //                                                         color:
    //                                                             Colors.black),
    //                                                   )),
    //                                                 )
    //                                               ],
    //                                             ),
    //                                           ),
    //                                           Container(
    //                                             margin: EdgeInsets.only(top: 5),
    //                                             child: Column(
    //                                               crossAxisAlignment:
    //                                                   CrossAxisAlignment.start,
    //                                               children: [
    //                                                 Row(
    //                                                   mainAxisAlignment:
    //                                                       MainAxisAlignment
    //                                                           .spaceAround,
    //                                                   children: [
    //                                                     GetType(
    //                                                         documentID:
    //                                                             docIDs[index]),
    //                                                     GestureDetector(
    //                                                       onTap: () {
    //                                                         print("icon loved");
    //                                                         ButtonStyle(
    //                                                             iconColor:
    //                                                                 MaterialStatePropertyAll(
    //                                                                     Colors
    //                                                                         .amber));
    //                                                       },
    //                                                       child: Icon(
    //                                                         Icons
    //                                                             .favorite_border_outlined,
    //                                                         size: 17,
    //                                                       ),
    //                                                     )
    //                                                   ],
    //                                                 ),
    //                                                 Container(
    //                                                     margin: EdgeInsets.only(
    //                                                         left: 13, top: 6),
    //                                                     child: FittedBox(
    //                                                         child: Row(
    //                                                       children: [
    //                                                         Container(
    //                                                           padding: EdgeInsets
    //                                                               .only(
    //                                                                   right: 8),
    //                                                           child: GetName(
    //                                                               documentID:
    //                                                                   docIDs[
    //                                                                       index]),
    //                                                         ),
    //                                                       ],
    //                                                     ))),
    //                                               ],
    //                                             ),
    //                                           )
    //                                         ],
    //                                       )),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.only(top: 20, bottom: 20),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(15),
    //                           border: Border.all(color: Colors.black)),
    //                       width: 370,
    //                       child: Column(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           //tulisan allproduct
    //                           Container(
    //                               margin: EdgeInsets.only(top: 20),
    //                               height: 50,
    //                               width: 340,
    //                               decoration: BoxDecoration(
    //                                 color:
    //                                     const Color.fromRGBO(97, 155, 138, 1),
    //                                 border: Border.all(color: Colors.black),
    //                                 borderRadius:
    //                                     BorderRadius.all(Radius.circular(10)),
    //                               ),
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   Text(
    //                                     "All Product",
    //                                     style: TextStyle(
    //                                         fontSize: 16,
    //                                         fontWeight: FontWeight.bold),
    //                                   )
    //                                 ],
    //                               )),
    //                           Container(
    //                             height: 400,
    //                             width: 370,
    //                             child: FutureBuilder(
    //                               builder: (context, snapshot) {
    //                                 return GridView.builder(
    //                                   shrinkWrap: true,
    //                                   gridDelegate:
    //                                       SliverGridDelegateWithFixedCrossAxisCount(
    //                                           crossAxisCount: 2),
    //                                   itemCount: docIDs.length,
    //                                   itemBuilder: (context, index) => Padding(
    //                                     padding: const EdgeInsets.all(5.0),
    //                                     child: Container(
    //                                         decoration: BoxDecoration(
    //                                             border: Border.all(
    //                                                 color: Colors.black),
    //                                             borderRadius: BorderRadius.all(
    //                                                 Radius.circular(10))),
    //                                         child: Column(
    //                                           children: [
    //                                             Container(
    //                                               child: Column(
    //                                                 children: [
    //                                                   Container(
    //                                                       //gambar
    //                                                       ),
    //                                                   Container(
    //                                                     height: 120,
    //                                                     decoration:
    //                                                         BoxDecoration(
    //                                                             border: Border(
    //                                                       bottom: BorderSide(
    //                                                           color:
    //                                                               Colors.black),
    //                                                     )),
    //                                                   )
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                             Container(
    //                                               margin:
    //                                                   EdgeInsets.only(top: 5),
    //                                               child: Column(
    //                                                 crossAxisAlignment:
    //                                                     CrossAxisAlignment
    //                                                         .start,
    //                                                 children: [
    //                                                   Container(
    //                                                     margin: EdgeInsets.only(
    //                                                         left: 10,
    //                                                         right: 20),
    //                                                     child: Row(
    //                                                       mainAxisAlignment:
    //                                                           MainAxisAlignment
    //                                                               .spaceBetween,
    //                                                       children: [
    //                                                         GetType(
    //                                                             documentID:
    //                                                                 docIDs[
    //                                                                     index]),
    //                                                         GestureDetector(
    //                                                           onTap: () {
    //                                                             print(
    //                                                                 "icon loved");
    //                                                             ButtonStyle(
    //                                                                 iconColor:
    //                                                                     MaterialStatePropertyAll(
    //                                                                         Colors.amber));
    //                                                           },
    //                                                           child: Icon(
    //                                                             Icons
    //                                                                 .favorite_border_outlined,
    //                                                             size: 17,
    //                                                           ),
    //                                                         )
    //                                                       ],
    //                                                     ),
    //                                                   ),
    //                                                   Container(
    //                                                       margin:
    //                                                           EdgeInsets.only(
    //                                                               left: 13,
    //                                                               top: 6),
    //                                                       child: FittedBox(
    //                                                           child: Row(
    //                                                         children: [
    //                                                           Container(
    //                                                             padding: EdgeInsets
    //                                                                 .only(
    //                                                                     right:
    //                                                                         8),
    //                                                             child: GetName(
    //                                                                 documentID:
    //                                                                     docIDs[
    //                                                                         index]),
    //                                                           ),
    //                                                         ],
    //                                                       ))),
    //                                                 ],
    //                                               ),
    //                                             )
    //                                           ],
    //                                         )),
    //                                   ),
    //                                 );
    //                               },
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Expanded(
    //           flex: 1,
    //           child: Container(
    //             decoration: BoxDecoration(
    //                 border: Border(top: BorderSide(color: Colors.black))),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
