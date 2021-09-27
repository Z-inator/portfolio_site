import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 400,
                  child: ContactFormField(
                    errorMessage: 'Please enter some text.',
                    hintText: 'Your Name',
                    icon: Icon(Icons.person),
                    labelText: 'Name',
                    validator: (value) {
                      return (value != null || value.isEmpty)
                          ? 'Please enter some text.'
                          : null;
                    },
                  ),
                ),
                Container(
                  width: 400,
                  child: ContactFormField(
                    errorMessage: 'Please enter some text.',
                    hintText: 'Your Name',
                    icon: Icon(Icons.person),
                    labelText: 'Name',
                    validator: (value) {
                      return (value != null || value.isEmpty)
                          ? 'Please enter some text.'
                          : null;
                    },
                  ),
                )
              ],
            ),
            Container(
              child: ContactFormField(
                    errorMessage: 'Please enter some text.',
                    hintText: 'Your Name',
                    icon: Icon(Icons.person),
                    labelText: 'Name',
                    validator: (value) {
                      return (value != null || value.isEmpty)
                          ? 'Please enter some text.'
                          : null;
                    },
                  ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process
                  }
                },
                child: Text('Submit'))
          ],
        ));
  }
}

class ContactFormField extends StatelessWidget {
  final String errorMessage;
  final String hintText;
  final String labelText;
  final Icon icon;
  final FormFieldValidator validator;
  const ContactFormField({
    Key? key,
    required this.errorMessage,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
        decoration: InputDecoration(
          hintText: hintText,
          icon: icon,
          labelText: labelText,
          errorText: errorMessage,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          filled: true,
          fillColor: Colors.grey[200],
          focusColor: Colors.cyan,
        ),
        validator: validator);
  }
}

class ContactPage extends StatelessWidget {
  // final BoxConstraints pageConstraints;
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 760,
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              child: Center(
            child:
                Text('Contact', style: Theme.of(context).textTheme.headline4),
          )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20),
                            decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            child: TextFormField())),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 20),
                            decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            child: TextFormField()))
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: TextFormField()),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: TextFormField())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
