import 'package:flutter/material.dart';
import 'package:task1/custom_buttom.dart';
import 'package:task1/custom_textformfiled.dart';

class Regester extends StatefulWidget {
  const Regester({super.key});
  static String id = 'regester';
  @override
  State<Regester> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Regester> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? username;
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hello! Register to get started',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 35),
              // Username Field
              CustomFormTextField(
                hintText: 'Username',
                inputType: 'username',
                onChanged: (value) {
                  username = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Email Field
              CustomFormTextField(
                hintText: 'Email',
                inputType: 'email',
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a correct email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Password Field
              CustomFormTextField(
                hintText: 'Enter password',
                inputType: 'password',
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              CustomFormTextField(
                hintText: 'Confirm password',
                inputType: 'password',
                onChanged: (value) {
                  confirmPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),

              Custombuttom(
                text: 'Register',
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Registering...')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please check your inputs')));
                  }
                },
              ),
              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('_______________ Or Register with ________________',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLoginButton(Icons.facebook, Colors.blue),
                  SizedBox(width: 50),
                  _buildSocialLoginButton(
                      Icons.g_mobiledata_outlined, Colors.red),
                  SizedBox(width: 50),
                  _buildSocialLoginButton(Icons.apple, Colors.black),
                ],
              ),
              SizedBox(height: 120),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                    child: Text(
                      '  Login Now',
                      style: TextStyle(color: Color.fromARGB(255, 8, 231, 190)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(IconData icon, Color color) {
    return Container(
      width: 110,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        iconSize: 45,
        onPressed: () {},
      ),
    );
  }
}
