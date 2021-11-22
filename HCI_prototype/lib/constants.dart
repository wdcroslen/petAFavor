import 'package:flutter/material.dart';

TextStyle petProfileNameStyle(){
  return const TextStyle(color: Colors.green, fontSize: 35, fontWeight: FontWeight.w500);
}

TextStyle petProfileAgeStyle(){
  return TextStyle(color: Colors.green[300], fontSize: 25, fontWeight: FontWeight.w500);
}

TextStyle petProfileGenderStyle(){
  return const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500);
}

TextStyle personProfileNameStyle(){
  return const TextStyle(color: Colors.red, fontSize: 35, fontWeight: FontWeight.w500);
}

TextStyle bold(){
  return const TextStyle(fontWeight: FontWeight.bold);
}

ButtonStyle requestButton(){
  return ElevatedButton.styleFrom(
      primary: Colors.red[300],
      textStyle: const TextStyle(fontSize: 20),
      side: const BorderSide(
          width: 1.0,
          color: Colors.yellow,
      ),
  );
}

InputDecoration textFieldDecoration(){
  return const InputDecoration(
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange, width: 2.0),
    ),
  );
}
