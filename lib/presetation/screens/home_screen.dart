import 'package:form/models/model.dart';
import 'package:form/presetation/screens/form_screen.dart';
import 'package:form/presetation/widgets/form_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Form",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users').snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (ctx, index) =>
                FormCard(
                  fName: docs[index]['fName'],
                  sName: docs[index]['sName'],
                  tName: docs[index]['tName'],
                  phone: docs[index]['phone'],
                  email: docs[index]['email'],
                  age: docs[index]['age'],
                  school: docs[index]['school'],),
          );
        },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return FormScreen();
            }));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
    );
  }
}
