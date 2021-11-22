import 'package:flutter/material.dart';
import 'favors_needed_page.dart';
import 'objects.dart';
import 'edit_profile.dart';
import 'pet_profile.dart';

List<Request> favors = [Request("2:30 PM"), Request("2:50 PM")];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prototype',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
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
                    Icons.home,
                    color: Colors.white,
                    size:80.0,
                  ),
                  label: const Text(
                    'House Sitting',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    // fillRequestList();
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => FavorsNeeded()));

                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                  ),
                ),
            ),
            SizedBox( height:25),
            SizedBox(
              height: deviceHeight/3,
              width: deviceWidth-50, // <-- match_parent
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.pets,
                  color: Colors.white,
                  size:80.0,
                ),
                label: const Text(
                  'Run/Walk',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => PetProfile()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              )
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}







class HouseSitting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.purple,
      ),
        body: Text("HouseSitting Page")
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
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'enter username',
                ),
                validator: (value) =>
                !_notEmpty(value.toString()) ? 'Username is required' : null,
              ),

              TextFormField(
                key: _passwordFormFieldKey,
                obscureText: true,
                decoration: InputDecoration(
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


