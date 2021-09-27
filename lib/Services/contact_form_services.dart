import 'package:flutter/cupertino.dart';

class ContactFormState extends ChangeNotifier {
  String name = '';
  String email = '';
  String message = '';
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
    message = input;
    notifyListeners();
  }

  String? validateMessagee() {
    return (message.isEmpty) ? 'Please enter your message.' : null;
  }
}
