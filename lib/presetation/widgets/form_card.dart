import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final String fName;
  final String sName;
  final String tName;
  final String phone;
  final String email;
  final String age;
  final String school;

  FormCard({
    required this.fName,
    required this.sName,
    required this.tName,
    required this.phone,
    required this.email,
    required this.age,
    required this.school,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCard(title:"First Name : " ,text: fName),
            TextCard(title:"Second Name : "  ,text: sName),
            TextCard(title:"Third Name : " ,text: tName),
            TextCard(title:"Phone Number : " ,text: phone),
            TextCard(title:"E-mail : " ,text: email),
            TextCard(title:"Age : " ,text: age),
            TextCard(title:"School : " ,text: school),
          ],
        ),
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    required this.text, required this.title,
  }) : super(key: key);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
        child: Text(title+text,style: const TextStyle(fontSize: 14),));
  }
}
