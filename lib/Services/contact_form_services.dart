import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactFormState extends ChangeNotifier {
  String name = '';
  String email = '';
  String body = '';
  GlobalKey<FormState> formKey;
  ContactFormState({required this.formKey});

  void changeName(String input) {
    name = input;
    notifyListeners();
  }

  String? validateName() {
    return (name.isEmpty) ? 'Please enter your name.' : null;
  }

  void changeEmail(String input) {
    email = input;
    notifyListeners();
  }

  String? validateEmail() {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)
        ? null
        : 'anything@anything.com';
  }

  void changeMessage(String input) {
    body = input;
    notifyListeners();
  }

  String? validateMessagee() {
    return (body.isEmpty) ? 'Please enter your message.' : null;
  }

  void resetValues() {
    name = '';
    email = '';
    body = '';
    formKey.currentState?.reset();
  }

  Future<String> sendInquiry() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inquiries = firestore.collection('inquiries');
    String output = '';
    await inquiries.doc(email).set({
      'name': name,
      'email': email,
      'message': body,
      'time': DateTime.now(),
      'replied': false
    }).then((value) {
      output = 'Successfully sent inquiry.';
      resetValues();
    }).catchError((error) {
      output = 'Error sending inquiry. $error';
    });
    return output;
  }
}
