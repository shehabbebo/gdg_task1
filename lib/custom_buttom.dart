import 'package:flutter/material.dart';

class Custombuttom extends StatelessWidget {
  Custombuttom({super.key, required this.text, required this.onTap});
  
  String text;
  VoidCallback? onTap; 
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
