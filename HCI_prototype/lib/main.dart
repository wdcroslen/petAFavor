import 'package:flutter/material.dart';
import 'favors_needed_page.dart';
import 'objects.dart';
import 'pet_profile.dart';
import 'request_page.dart';

const List<Choice> choices = <Choice>[
  Choice(title: 'My Profile',
      icon: Icon(Icons.person, color: Colors.black)),
  Choice(title: 'My Dogs', icon: Icon(Icons.pets, color: Colors.black)),
];

List<Request> favors = [Request("2:30 PM"), Request("2:50 PM")];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prototype',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Choice _selectedChoice = choices[0];
  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading:
        PopupMenuButton<Choice>(
          onSelected: _select,
          itemBuilder: (BuildContext context) {
            return choices.map((Choice choice) {
              return PopupMenuItem<Choice>(
                  value: choice,
                  child: Row(children: [Text(choice.title), SizedBox(width:20),choice.icon]),
              );
            }).toList();
          },
        ),
        // IconButton(
        //   icon: const Icon(
        //   Icons.menu,
        //   color: Colors.black,
        //       ),
        // onPressed: () {},),
        title:  Text('Home')//new Center(child: new Text('Home Prototype', textAlign: TextAlign.center)),
      ),
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox( height:25),
            SizedBox(
                height: deviceHeight/3,
                width: deviceWidth-50, // <-- match_parent
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size:80.0,
                  ),
                  label: const Text(
                    'Favors',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => FavorsNeeded()));
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[300],
                  ),
                ),
            ),
            SizedBox( height:25),
            SizedBox(
              height: deviceHeight/3,
              width: deviceWidth-50, // <-- match_parent
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.nature_people,
                  color: Colors.white,
                  size:80.0,
                ),
                label: const Text(
                  'Request',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => RequestPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[300],
                ),
              )
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class Walking extends StatelessWidget {
  final GlobalKey<FormFieldState<String>> _usernameFormFieldKey = GlobalKey();
  final GlobalKey<FormFieldState<String>> _passwordFormFieldKey = GlobalKey();
  _notEmpty(String value) => value != null && value.isNotEmpty;
  get _values =>
      ({
        'username': _usernameFormFieldKey.currentState?.value,
        'password': _passwordFormFieldKey.currentState?.value
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Walking"),
        ),
        body:  Form(
          child: Center(child:Column(
            children: <Widget>[
              TextFormField(
                key: _usernameFormFieldKey,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'enter username',
                ),
                validator: (value) =>
                !_notEmpty(value.toString()) ? 'Username is required' : null,
              ),

              TextFormField(
                key: _passwordFormFieldKey,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) =>
                !_notEmpty(value.toString()) ? 'Password is required' : null,
              ),
              Builder(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text('Log In'),
                      onPressed: () {
                        if (Form.of(context)!.validate()) {
                          if (_values['username'].length != 0){
                            print("YAY");
                          }
                          print(_values);
                        }
                      },
                    ),
                    SizedBox(height: 100, width:25),
                    ElevatedButton(
                      child: Text('Reset'),
                      onPressed: () => Form.of(context)!.reset(),
                    )
                  ],
                );
              }),
            ],
          ),
          ),
        )
    );
  }
}


class ChoiceCard extends StatelessWidget {
  final Choice choice;

  ChoiceCard({required this.choice});

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.subtitle1;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                choice.icon.icon,
                size: 128.0,
              ),
              Text(choice.title, style: textStyle)
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final Icon icon;
  // final IconData icon;
}

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  Choice _selectedChoice = choices[0];

  @override
  Widget build(BuildContext context) {
    var title = "AppBar demo";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                      value: choice,
                      child: Text(choice.title)
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: ChoiceCard(choice: _selectedChoice,),
      ),
    );
  }

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }
}
