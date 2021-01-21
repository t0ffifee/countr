import 'package:hive/hive.dart';
import '../constants/constants.dart';

part 'Event.g.dart';

@HiveType(typeId: 1)
class Event {
  @HiveField(0)
  DateTime eventDate;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  int iconCodePoint;

  DateTime get eDate {
    return eventDate;
  }

  String get eTitle {
    return title;
  }

  String get eDescription {
    return description;
  }

  int get eIconCodePoint {
    return iconCodePoint;
  }

  Event(this.eventDate, this.title, this.description, this.iconCodePoint);

  void saveEvent() {
    var box = Hive.box<Event>(eventBox);
    box.add(this);
    print(this);
  }

  // void createNotification() {
  //   throw UnimplementedError;
  //   // pak de date time, doe daar wat berekeningen mee en sla een notification mee op
  // }

  @override
  String toString() {
    return "\n[TITEL] $title \[BESCHRIJVING] $description";
  }
}
