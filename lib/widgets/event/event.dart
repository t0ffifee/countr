import 'package:hive/hive.dart';
import 'package:countdown_app/constants/constants.dart';

part 'event.g.dart';

// Titel (String), Beschrijving (String), Datum/Tijd (DateTime), Icoon (int), Kleur (int), ShowNotification (bool)

@HiveType(typeId: 1)
class Event {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  int iconCodePoint;

  @HiveField(4)
  int color;

  @HiveField(5)
  bool notification;

  DateTime get eDate {
    return date;
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

  int get eColor {
    return color;
  }

  Event(this.date, this.title, this.description, this.iconCodePoint, this.color,
      this.notification);

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
