import 'package:flutter/material.dart';

Widget textField(Size size, String name, bool obsecure, TextEditingController textEditingController ) {
    return TextField(
      obscureText: obsecure ,
      controller: textEditingController,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: Colors.white,
          isDense: true,
          // Added this
          contentPadding: EdgeInsets.all(10),
          hintText: name),
    );
  }