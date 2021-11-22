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

Container profileCard(String imageURL, String name, String date){
  return Container(
    padding: EdgeInsets.fromLTRB(2, 0, 5, 0),
    child:
    Card(
        elevation: 2,
        color:Colors.green,
        child: ListTile(
          leading: Container(width: 45,
            height: 115,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.white),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.fromOffsetAndSize(
                      const Offset(
                        1.0,
                        -50,
                      ),
                      const Size(
                        100,
                        100,
                      ),
                    ),
                    image: NetworkImage(
                      imageURL
                    ))),
          ),

          title: Row(children: [Text(name, style: bold()), SizedBox(width:25), Text(date)]),
          //subtitle: Text("hello"),
          // onTap: () {
          //   // openRequest(request[index])
          //},
        )
    ),
  );
}
