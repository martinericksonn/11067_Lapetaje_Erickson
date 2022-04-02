import 'package:intl/intl.dart';

class Todo {
  String details;
  late DateTime created;
  int id;

  Todo({this.details = '', DateTime? created, this.id = 0}) {
    created == null ? this.created = DateTime.now() : this.created = created;
  }

  String get parsedDate {
    return DateFormat.yMMMEd().format(created);
  }

  updateDetails(String update) {
    details = update;
    created = DateTime.now();
  }
}
