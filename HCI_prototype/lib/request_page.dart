import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hci_prototype/constants.dart';
import 'objects.dart';
import 'main.dart';
// import 'package:dropdown_date_picker/dropdown_date_picker.dart';


class RequestPage extends StatefulWidget {
  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends  State<RequestPage>  {
  String dropdownValue = 'Walk Dog';
  String dogValue = 'Tommy';
  // Container container = petProfileCardNoMethod(Colors.blue[200], "https://www.cdc.gov/healthypets/images/pets/cute-dog-headshot.jpg?_=42445",
  //     'Tommy', 'Aug. 11, 2021',4);
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue[200],
      ),
      body:
      Column(children: [
        SizedBox(height: 45),
        SizedBox(height: 45,
          child:
          Row(
            children: [
              SizedBox(width:50),
            Text('Pet  ', style: petProfileGenderStyle()),
              SizedBox(width:20),
              SizedBox(width: 150,child:
              DropdownButton<String>(
                value: dogValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.blueGrey),
                underline: Container(
                  height: 2,
                  color: Colors.blueGrey,
                ),
                onChanged: (String? newValue) {
                },
                  items: ["Tommy",'Johnathan', 'The Rock']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              )
            ]
          ),
        ),
      petProfileCardNoMethod(Colors.blue[200], "https://www.cdc.gov/healthypets/images/pets/cute-dog-headshot.jpg?_=42445",
            'Tommy', 'Aug. 11, 2021',4),
        SizedBox(height: 45),
        SizedBox(height: 45,
          child:
          Row(
              children: [
                SizedBox(width:30),
                Text('Activity', style: petProfileGenderStyle()),
                SizedBox(width:20),
                SizedBox(width: 150,child:
                  DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.blueGrey),
                      underline: Container(
                      height: 2,
                      color: Colors.blueGrey,
                      ),
                      onChanged: (String? newValue) {
                      },
                      items: <String>['Walk Dog', 'Sit Dog']
                          .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                      }).toList(),
                  )
)
              ]
          ),
        ),

        SizedBox(height: 45),
        SizedBox(height: 45,
          child:
          Row(
              children: [
                SizedBox(width:20),
                Text('Date', style: petProfileGenderStyle()),
                SizedBox(width:20),
                SizedBox(width: 275,child:
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    // Do something
                  },
                ),
                )
              ]
          ),
        ),

        SizedBox(height: 65),
        ElevatedButton(
          child: Text('Request'),
          onPressed: (){},
          style: requestButton(),
        ),

      ],
      ),

    );
  }
}