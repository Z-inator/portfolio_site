import 'package:flutter/material.dart';
import 'package:portfolio_site/Services/contact_form_services.dart';
import 'package:provider/provider.dart';

class LargeContactForm extends StatelessWidget {
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
                  Container(
                    child: Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Your Name',
                          icon: Icon(Icons.person_rounded),
                          labelText: 'Name',
                        ),
                        validator: (value) => contactFormState.validateName(),
                        onChanged: (String text) => contactFormState.changeName(text),
                      ),
                    )
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Your Email',
                        icon: Icon(Icons.email_rounded),
                        labelText: 'Email',
                      ),
                      validator: (value) => contactFormState.validateEmail(),
                      onChanged: (String text) => contactFormState.changeEmail(text),
                    )
                  ),
                  
                ],
              ),
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Your Message',
                  icon: Icon(Icons.comment_rounded),
                  labelText: 'Message',
                ),
                validator: (value) => contactFormState.validateMessagee(),
                onChanged: (String text) => contactFormState.changeMessage(text),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: ElevatedButton(
                  onPressed: () {
                    if (contactFormState.formKey.currentState!.validate()) {
                      // Process
                    }
                  },
                  child: Text('Submit')),
            )
          ],
        ));
  }
}



