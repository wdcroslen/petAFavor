import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hci_prototype/constants.dart';
import 'objects.dart';
import 'main.dart';


class FavorsNeeded extends StatefulWidget {
  @override
  State<FavorsNeeded> createState() => _FavorsNeededState();
}

class _FavorsNeededState extends  State<FavorsNeeded>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favors',style: TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // actions: const [
          //   Icon(Icons.favorite),
          //   Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     child: Icon(Icons.search),
          //   ),
          //   Icon(Icons.more_vert),
          // ],
          backgroundColor: Colors.red[200],
        ),
        body:
        Column(children: [
          SizedBox(height: 45,
            child:
              Center(
                  child:
                  Text('Needs Sitting', style: petProfileGenderStyle()),
                  // Text("House Sitting",
                  //     style: TextStyle(backgroundColor: Colors.redAccent, color: Colors.black, fontSize: 20))

              ),

          ),


    //       Expanded(child:
    //         SizedBox(height: 200,
    //         child:
    //       ListView.builder(
    //         itemCount: favors.length,
    //         itemBuilder: (BuildContext context, int index) {
    //          Request request = favors[index];
    //          Color color = Colors.blueGrey;
    //          if (index%2==0) {
    //            color = Colors.lightBlue;
    //          } else {
    //            color = Colors.blueGrey;
    //          }
    //
    //       return Container(
    //           padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    //           child: Slidable(
    //               actionPane: SlidableDrawerActionPane(),
    //               actionExtentRatio: .25,
    //               secondaryActions: const [
    //                 IconSlideAction(
    //                     caption: "Delete",
    //                     color: Colors.red,
    //                     icon: Icons.delete,
    //                     //onTap: () => _deleteNote(context, model, note)
    //                 )
    //               ],
    //           child:
    //
    //           Card(
    //                   elevation: 2,
    //                   color: color,
    //                   child: ListTile(
    //                     leading: const CircleAvatar(
    //                       backgroundColor : Colors.black,
    //                       foregroundColor : Colors.white,
    //                     //FileImage(avatarFile) : null,
    //                       child :Text('I'),
    //                     ),
    //                   title: Text("Request $index"),
    //                   subtitle: Text(request.time),
    //                   // onTap: () {
    //                   //   // openRequest(request[index])
    //                   //},
    //                   )
    //           ),
    //           )
    //       );
    //     }
    // ),
    //     ),
    //       ),
        Container(color: Colors.red[300], child: Row(children: [SizedBox(width:85),
          Text("Name", style: boldBig()), SizedBox(width:55), Text("Date",style: boldBig()), SizedBox(width:75), Text("Hour",style: boldBig())
        ]),
        ),
          Container(height: 200,child:
          ListView(children: [
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[100], "Puppy 1", "Mon. Oct. 25, 2021", "2:30 PM"),
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[150], "Puppy 2", "Tue. Oct. 26, 2021", "2:50 PM"),
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[100], "Puppy 3", "Thur. Oct. 28, 2021", "8:30 AM"),
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[150], "Puppy 4", "Thur. Oct. 28, 2021", "8:30 AM"),
          ],
          ),
          ),


          Divider(color: Colors.black, thickness: 7,),
          Text('Needs Walking', style: petProfileGenderStyle()),

          Container(color: Colors.red[300], child: Row(children: [SizedBox(width:85),
            Text("Name", style: boldBig()), SizedBox(width:55), Text("Date",style: boldBig()), SizedBox(width:75), Text("Hour",style: boldBig())
          ]),
          ),
          Container(height: 200,child:
                ListView(children: [
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[100], "Puppy 1", "Mon. Oct. 25, 2021", "2:30 PM"),
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[150], "Puppy 2", "Tue. Oct. 26, 2021", "2:50 PM"),
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[100], "Puppy 3", "Thur. Oct. 28, 2021", "8:30 AM"),
            favorCard(context,'https://upload.wikimedia.org/wikipedia/commons/5/5b/My_new_puppy%2C_Link.jpg',
                Colors.red[150], "Puppy 4", "Thur. Oct. 28, 2021", "8:30 AM"),
                ],
                ),
          ),
          ElevatedButton(
            child: Text('Grant Favor'),
            onPressed: (){},
            style: requestButton(),
          ),
        ],
        ),
    //   bottomNavigationBar: Stack(
    //   alignment: const FractionalOffset(.5, 1.0),
    //   children: [
    //     Container(
    //       height: 40.0,
    //       color: Colors.red[200]//Theme.of(context).backgroundColor,
    //     ),
    //      Padding(
    //       padding: const EdgeInsets.only(bottom: 12.0),
    //       child: ElevatedButton(
    //
    //         //notchMargin: 24.0,
    //         onPressed: () => print('hello world'),
    //         child: const Text('Request Favor'),
    //         style:  requestButton()
    //       ),
    //     ),
    //   ],
    // ),

    );
  }
}