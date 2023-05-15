import 'package:flutter/material.dart';
import 'package:gym_home/pages/register.dart';
import 'package:gym_home/pages/setup.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoginForm = true;
  String _email = '', _password = '';

  // Function to switch between login and signup form
  void _toggleFormMode() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  // Function to handle form submission
  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // Authenticate user with entered email and password
      if (_isLoginForm) {
        // Perform login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Perform signup
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoginForm ? 'Login' : 'Sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Email is required' : null,
                onSaved: (value) => _email = value!.trim(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Password is required' : null,
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_isLoginForm ? 'Login' : 'Sign Up'),
              ),
              TextButton(
                onPressed: _toggleFormMode,
                child: Text(_isLoginForm
                    ? 'Create an account'
                    : 'Already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
