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
          title: const Text('Favors'),
          actions: const [
            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Colors.red[200],
        ),
        body:
        Column(children: [
          const SizedBox(height: 90,
            child:
              Center(
                  child:
                  Text("House Sitting",
                      style: TextStyle(backgroundColor: Colors.blueGrey, color: Colors.black, fontSize: 20))

              ),

          ),


          Expanded(child:
            SizedBox(height: 200,
            child:
          ListView.builder(
            itemCount: favors.length,
            itemBuilder: (BuildContext context, int index) {
             Request request = favors[index];
             Color color = Colors.blueGrey;
             if (index%2==0) {
               color = Colors.lightBlue;
             } else {
               color = Colors.blueGrey;
             }

          return Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: .25,
                  secondaryActions: const [
                    IconSlideAction(
                        caption: "Delete",
                        color: Colors.red,
                        icon: Icons.delete,
                        //onTap: () => _deleteNote(context, model, note)
                    )
                  ],
              child:

              Card(
                      elevation: 2,
                      color: color,
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor : Colors.black,
                          foregroundColor : Colors.white,
                        //FileImage(avatarFile) : null,
                          child :Text('I'),
                        ),
                      title: Text("Request $index"),
                      subtitle: Text(request.time),
                      // onTap: () {
                      //   // openRequest(request[index])
                      //},
                      )
              ),
              )
          );
        }
    ),
        ),
          ),

      ],
        ),
      bottomNavigationBar: Stack(
      alignment: const FractionalOffset(.5, 1.0),
      children: [
        Container(
          height: 40.0,
          color: Colors.red[200]//Theme.of(context).backgroundColor,
        ),
         Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: ElevatedButton(

            //notchMargin: 24.0,
            onPressed: () => print('hello world'),
            child: const Text('Request Favor'),
            style:  requestButton()
          ),
        ),
      ],
    ),

    );
  }
}