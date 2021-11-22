import 'constants.dart';
class Request {
  Request(this.time);
  int id = -1;
  DateTime date = DateTime.now();
  String time = '';
  String description = 'Needs a walk';
}

class Pet {
  String name = 'Puppy';
  Request currentRequest = Request("8:30 AM");
  String address =  '1445 N Stanton, 79902';
  int age = 5;
  String gender = ' Female';
}