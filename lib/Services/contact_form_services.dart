import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';

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
    notifyListeners();
  }

  Future<String> sendInquiry() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inquiries = firestore.collection('inquiries');
    String output = '';
    await inquiries
        .add({'name': name, 'email': email, 'message': body, 'time': DateTime.now(), 'replied': false}).then((value) {
      output = 'Successfully sent inquiry.';
    }).catchError((error) {
      output = 'Error sending inquiry. $error';
    });
    return output;

    // final smtpServer = gmailSaslXoauth2(email, accessToken)

    // final Message message = Message()
    //   ..from = Address(email, name)
    //   ..recipients = ['zawauer@gmail.com']
    //   ..subject = 'Portfolio Site Inquiry'
    //   ..text = body;

    // try {
    //   await send(message, smtpServer);
    //   return 'success';
    // } on MailerException catch (e) {
    //   return e.toString();
    // }

    // final Email email = Email(
    //   body: message,
    //   subject: 'Portfolio Site Inquiry',
    //   recipient: 'zawauer@gmail.com',
    //   isHTML: true,
    // );

    // // String platformResponse;

    // try {
    //   await SendEmail.send(email);
    //   return 'success';
    // } catch (error) {
    //   return error.toString();
    // }

    // if (!mounted) return;

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(platformResponse),
    //   ),
    // );
  }
}
