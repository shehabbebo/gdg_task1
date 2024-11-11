import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  CustomFormTextField({
    this.hintText,
    this.onChanged,
    required this.inputType,
    this.obscureText = false,
    this.validator,
  });

  Function(String)? onChanged;
  final String? hintText;
  final String inputType;
  final String? Function(String?)? validator;

  var obscureText;
  @override
  _CustomFormTextFieldState createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  bool _obscureText = true;
  String? _validateInput(String? value) {
    if (widget.validator != null) {
      return widget.validator!(value);
    }

    //
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validateInput,
      onChanged: widget.onChanged,
      obscureText: widget.inputType == "password" && _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        suffixIcon: widget.inputType == "password"
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}


   //   if (widget.inputType == "email") {
    //     final emailRegex =
    //         RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    //     if (value == null || value.isEmpty) {
    //       return 'Enter your Email';
    //     } else if (!emailRegex.hasMatch(value)) {
    //       return 'Please enter correct email';
    //     }
    //   } else if (widget.inputType == "password") {
    //     if (value == null || value.isEmpty) {
    //       return 'Enter your passwprd';
    //     } else if (value.length < 8) {
    //       return 'Password must be at least 8 characters long';
    //     }
    //   }
    //   return null;