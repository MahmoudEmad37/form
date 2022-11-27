import 'package:form/models/model.dart';
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
      child: Column(
        children: [
          Text(fName),
          Text(sName),
          Text(tName),
          Text(phone),
          Text(email),
          Text(age),
          Text(school),
        ],
      ),
    );
  }
}
