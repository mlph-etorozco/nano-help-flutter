import 'package:flutter/material.dart';
import 'package:nano_help/components/button.dart';
import 'package:nano_help/components/nav_bar.dart';

class RegisterScreen extends StatefulWidget {
  final String title = "Donator Sign Up";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  String fullName = '';
  String governmentId = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          elevation: null,
          title: const Text(
            "",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.orange)),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text.rich(
                TextSpan(
                  text: 'Sign Up\n', // default text style
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Fill up the form below to register as a donator.',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.length < 4) {
                  return 'Enter at least 4 characters';
                } else {
                  return null;
                }
              },
              onSaved: (value) => setState(() => fullName = value!),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Government ID',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter you government id';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.text,
              onSaved: (value) => setState(() => governmentId = value!),
            ),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                text:
                    'Create a password so you can login and donate securely.\n', // default text style
                children: <TextSpan>[
                  TextSpan(
                      text: 'Must have atleast 7 charaters',
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.length < 7) {
                  return 'Password must be at least 7 characters long';
                } else {
                  return null;
                }
              },
              onSaved: (value) => setState(() => password = value!),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.length < 7) {
                  return 'Password must be at least 7 characters long';
                } else if (confirmPassword != password) {
                  return 'Password mismatch';
                } else {
                  return null;
                }
              },
              onSaved: (value) => setState(() => confirmPassword = value!),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(height: 32),
            Button(
                text: "Register",
                onPressed: () {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    formKey.currentState!.save();
                    const snackBar = SnackBar(
                      content: Text(
                        "Thank you for registering as a Donator!",
                        style: TextStyle(fontSize: 20),
                      ),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }),
          ],
        ),
      ));
}
