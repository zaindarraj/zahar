import 'package:flutter/material.dart';

TextButton button(String name,Color color ,Size size, BuildContext context, void Function () function) {
    return TextButton(
                onPressed: function,
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.054,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(name, style: TextStyle(
                    color: Colors.black,
                    fontWeight:FontWeight.bold,
                    fontSize: MediaQuery.of(context).textScaleFactor*20
                  ),),
                ),
              );
  }

  