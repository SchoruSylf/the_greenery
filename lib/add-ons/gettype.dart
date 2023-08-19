import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetType extends StatelessWidget {
  final String documentID;

  GetType({required this.documentID});

  @override
  Widget build(BuildContext context) {
    CollectionReference plants = FirebaseFirestore.instance.collection('plant');

    return FutureBuilder<DocumentSnapshot>(
        future: plants.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              '${data['planttype']}'
            );
          }
          return Text("Loading..");
        }));
  }
}
