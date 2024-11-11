import 'package:flutter/material.dart';
import 'package:task1/custom_buttom.dart';
import 'package:task1/custom_textformfiled.dart';
import 'package:task1/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back! Glad \nto see you, Again!',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              CustomFormTextField(
                hintText: 'Enter your email',
                inputType: 'email',
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your Email';
                  }
                  final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter correct email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomFormTextField(
                hintText: 'Enter your password',
                inputType: 'password',
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your passwprd';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters or number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Custombuttom(
                text: 'Log in',
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Logging in...')));
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
                  Text(
                    '_______________ Or Login with ________________',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLoginButton(Icons.facebook, Colors.blue),
                  SizedBox(width: 20),
                  _buildSocialLoginButton(
                      Icons.g_mobiledata_outlined, Colors.red),
                  SizedBox(width: 20),
                  _buildSocialLoginButton(Icons.apple, Colors.black),
                ],
              ),
              SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Regester.id);
                    },
                    child: Text(
                      '  Register Now',
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
