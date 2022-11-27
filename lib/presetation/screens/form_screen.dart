import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form/models/model.dart';


class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {


  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  int _currentStep = 0;

  StepState getStepState({required int index}) {
    if (_currentStep == index) {
      return StepState.editing;
    } else if (index < _currentStep) {
      return StepState.complete;
    } else {
      return StepState.indexed;
    }
  }

  final Model _data=Model();

  List<Step> steps() => [
        Step(
            state: getStepState(index: 0),
            isActive: _currentStep >= 0,
            title: const Text('Personal'),
            content: Form(
              key: _formKeys[0],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (val) {
                      _data.fName = val!;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Second Name',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (val) {
                      _data.sName = val!;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Third Name',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (val) {
                      _data.tName= val!;
                    },
                  ),
                ],
              ),
            )),
        Step(
            state: getStepState(index: 1),
            isActive: _currentStep >= 1,
            title: const Text('Contact'),
            content: Form(
              key: _formKeys[1],
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val!.isEmpty || val.length < 11) {
                        return 'Invalid phone number';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _data.phone = val!;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-Mail',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty || !val.contains('@')) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _data.email = val!;
                    },
                  ),
                ],
              ),
            )),
        Step(
            state: getStepState(index: 2),
            isActive: _currentStep >= 2,
            title: const Text('Education'),
            content: Form(
              key: _formKeys[2],
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (val) {
                      _data.age = val!;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'School Name',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (val) {
                      _data.school = val!;
                    },
                  ),
                ],
              ),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Form",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: steps(),
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            _submit(_formKeys[_currentStep]);
          });
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            _currentStep -= 1;
          }
          setState(() {});
        },
      ),
    );
  }

  void _submit(GlobalKey<FormState> formKey) async{
    final isValid = formKey.currentState!.validate();
    print(isValid);
    if (isValid) {
      formKey.currentState!.save();
      print(_data.toJson());
      if (_currentStep < (steps().length - 1)) {
        _currentStep += 1;
      } else if (_currentStep == (steps().length - 1)) {
         FirebaseFirestore.instance.collection('users').add(_data.toJson());
         Navigator.pop(context);
       }
    }
  }
}
