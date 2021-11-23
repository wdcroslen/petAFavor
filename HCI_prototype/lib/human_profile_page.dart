import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hci_prototype/constants.dart';
import 'objects.dart';
import 'package:intl/intl.dart';

Pet currentPet = Pet();
Person currentPerson = Person();

class PersonProfile extends StatelessWidget {
  const PersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonProfilePage(),
    );
  }
}

class PersonProfilePage extends StatefulWidget {
  @override
  _PersonProfilePageState createState() => _PersonProfilePageState();
}

class _PersonProfilePageState extends State<PersonProfilePage> {

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
        title: const Text("My Profile", style: TextStyle(color:Colors.black)),
        backgroundColor: Colors.red[200],
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
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
                            "https://www.emmys.com/sites/default/files/styles/bio_pics_detail/public/bios/kumail-nanjiani-450x600.jpg",
                          ))),
                ),
                const SizedBox(width: 10,),
                Column(
                    children: [
                      Text(currentPerson.name,
                          style: personProfileNameStyle()
                      ),
                      Row(children: const [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                      ]
                      ),
                      Text('Joined on January 19th, 2021'),
                      Text('300 Favors Completed'),
                    ]
                ),
                const SizedBox(
                  height: 35,
                ),
              ]
              ),
              SizedBox(height: 10,),
              SizedBox(height: 5,),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: SizedBox(
              //     width: 150.0,
              //     child:  ElevatedButton(
              //       child: Text('Grant Favor'),
              //       onPressed: (){},
              //       style: requestButton(),
              //     ),
              //   ),
              // ),
              Text('Has Sitted', style: petProfileGenderStyle()),
              petProfileCard(context, Colors.blue[200], "https://www.cdc.gov/healthypets/images/pets/cute-dog-headshot.jpg?_=42445",
                  'Tommy', 'Aug. 11, 2021',4),
              petProfileCard(context, Colors.lightBlueAccent, "https://www.themaineedge.com/media/k2/items/cache/1c72550d6134a289e35a027015d7e8b0_XL.jpg",
                  'Bad Dog', 'May 4, 2021',4),

              SizedBox(height: 20,),
              Text('Has Walked', style: petProfileGenderStyle()),

              petProfileCard(context, Colors.blue[200], "https://upload.wikimedia.org/wikipedia/commons/4/42/The_ROCK.jpg",
                  'The Rock', 'Oct. 20, 2021',3),

              SizedBox(height: 20,),

              Text('Reviews', style: petProfileGenderStyle()),
            ],
          ),
        ),
      ),
    );
  }
}