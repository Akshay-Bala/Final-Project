import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class customtextfield extends StatelessWidget {
  const customtextfield({super.key,required this.label,this.controller,this.validator,this.obscureText, this.suffix});
  final label;
  final controller;
  final validator;
  final obscureText;
  final suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //keyboardType: TextInputType.,
      controller: controller ,
      validator: validator ,
      
      obscureText: obscureText??false,
      decoration: InputDecoration(labelText: label??'null' ,
      suffixIcon: suffix??SizedBox(),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}