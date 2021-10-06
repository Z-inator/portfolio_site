import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/contact_form_services.dart';
import 'package:provider/provider.dart';

class LargeContactForm extends StatelessWidget {
  LargeContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactFormState contactFormState = Provider.of<ContactFormState>(context);
    return Form(
        key: contactFormState.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: ContactFormName()),
                  SizedBox(width: 40),
                  Expanded(child: ContactFormEmail()),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 40),
                child: ContactFormMessage()),
            Container(child: ContactFormSubmitButton())
          ],
        ));
  }
}

class SmallContactForm extends StatelessWidget {
  const SmallContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactFormState contactFormState = Provider.of<ContactFormState>(context);
    return Form(
        key: contactFormState.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: ContactFormName(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40),
              child: ContactFormEmail(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40),
              child: ContactFormMessage(),
            ),
            Container(
              child: ContactFormSubmitButton(),
            ),
          ],
        ));
  }
}

class ContactFormName extends StatelessWidget {
  late ContactFormState contactFormState;
  ContactFormName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contactFormState = Provider.of<ContactFormState>(context);
    return TextFormField(
      // initialValue: contactFormState.name,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: 'Your Name',
        icon: Icon(Icons.person_rounded),
        labelText: 'Name',
      ),
      validator: (value) => contactFormState.validateName(),
      onChanged: (String text) => contactFormState.changeName(text),
    );
  }
}

class ContactFormEmail extends StatelessWidget {
  late ContactFormState contactFormState;
  ContactFormEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contactFormState = Provider.of<ContactFormState>(context);
    return TextFormField(
      // initialValue: contactFormState.email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Your Email',
        icon: Icon(Icons.email_rounded),
        labelText: 'Email',
      ),
      validator: (value) => contactFormState.validateEmail(),
      onChanged: (String text) => contactFormState.changeEmail(text),
    );
  }
}

class ContactFormMessage extends StatelessWidget {
  late ContactFormState contactFormState;
  ContactFormMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contactFormState = Provider.of<ContactFormState>(context);
    return TextFormField(
      // initialValue: contactFormState.body,
      keyboardType: TextInputType.multiline,
      minLines: 5,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Your Message',
        alignLabelWithHint: true,
        icon: Icon(Icons.comment_rounded),
        labelText: 'Message',
      ),
      validator: (value) => contactFormState.validateMessagee(),
      onChanged: (String text) => contactFormState.changeMessage(text),
    );
  }
}

class ContactFormSubmitButton extends StatelessWidget {
  late ContactFormState contactFormState;
  ContactFormSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    contactFormState = Provider.of<ContactFormState>(context);
    return ElevatedButton(
        onPressed: () async {
          String platformResponse = '';
          if (contactFormState.formKey.currentState!.validate()) {
            await contactFormState.sendInquiry().then((value) {
              platformResponse = value;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(platformResponse),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(primary: theme.primaryColor, padding: EdgeInsets.all(20)),
        child: Text('Submit', style: theme.textTheme.headline6?.copyWith(color: Colors.white)));
  }
}
