import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hci_prototype/constants.dart';
import 'objects.dart';
import 'package:intl/intl.dart';

Pet currentPet = Pet();

class PetProfile extends StatelessWidget {
  const PetProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PetProfilePage(),
    );
  }
}

class PetProfilePage extends StatefulWidget {
  @override
  _PetProfilePageState createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage> {

  dateTimeToString(DateTime date){
    String day = '';
    String month = '';
    switch (date.weekday) {
      case 1: {day = "Monday"; break;}
      case 2: {day = "Tuesday";  break;}
      case 3: {day = "Wednesday"; break;}
      case 4: {day = "Thursday"; break;}
      case 5: {day = "Friday"; break;}
      case 6: {day = "Saturday"; break;}
      case 7: {day = "Sunday"; break;}
    }
    switch (date.month) {
      case 1: {month = "January"; break;}
      case 2: {month = "February";  break;}
      case 3: {month = "March"; break;}
      case 4: {month = "April"; break;}
      case 5: {month = "May"; break;}
      case 6: {month = "June"; break;}
      case 7: {month = "July"; break;}
      case 8: {month = "August"; break;}
      case 9: {month = "September"; break;}
      case 10: {month = "October"; break;}
      case 11: {month = "November"; break;}
      case 12: {month = "December"; break;}
    }

    return day + ', ' + month + ' ' + date.day.toString() + ', ' + date.year.toString();
  }
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Profile", style: TextStyle(color:Colors.black)),
        backgroundColor: Colors.green[200],
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg",
                              ))),
                    ),
                    const SizedBox(width: 35,),
                    Column(
                        children: [
                        Text(currentPet.name,
                            style: petProfileNameStyle()
                        ),
                        Row(children: [
                          Text(
                            currentPet.age.toString() + ' Months',
                            style: petProfileAgeStyle()
                          ),
                          Text(
                            currentPet.gender,
                            style: petProfileGenderStyle(),
                          ),
                          ]
                        ),
                        ElevatedButton(onPressed: (){},
                            child: const Text('More Info', style: TextStyle(color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontStyle: FontStyle.italic),
                            primary: Colors.amber[200]))
                        ]
                    ),
                  const SizedBox(
                    height: 35,
                  ),
              ]
              ),
              SizedBox(height: 10,),
              Text(currentPet.currentRequest.description, style: petProfileGenderStyle()),
              Text(dateTimeToString(currentPet.currentRequest.date),style:bold()),
              SizedBox(height: 5,),
              Text(currentPet.address),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                width: 150.0,
                child:  ElevatedButton(
                  child: Text('Grant Favor'),
                  onPressed: (){},
                  style: requestButton(),
                  ),
                ),
              ),
              Text('Notes', style: petProfileGenderStyle()),
              const SizedBox(height: 10,),
              TextFormField(decoration: textFieldDecoration(),),
              SizedBox(height: 20,),
              Text('Sitted By', style: petProfileGenderStyle()),

              profileCard(context,"https://upload.wikimedia.org/wikipedia/commons/4/42/The_ROCK.jpg",
                'The Rock', 'Wed. Oct. 20, 2021'),

              SizedBox(height: 20,),
              Text('Walked By', style: petProfileGenderStyle()),
              profileCard(context,"https://upload.wikimedia.org/wikipedia/commons/1/14/Deadpool_2_Japan_Premiere_Red_Carpet_Ryan_Reynolds_%28cropped%29.jpg",
              'Ryan Reynolds', 'Fri. Oct, 2021'),

            ],
          ),
        ),
      ),
    );
  }
}