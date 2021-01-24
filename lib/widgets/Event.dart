import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../constants/constants.dart';

// TODO dit bestand moet opnieuw gegenereerd worden voor deze class
// heb iets met de hand aangepast en het kan zijn dat het nu al werkt
part 'Event.g.dart';

@HiveType(typeId: 1)
class Event {
  @HiveField(0)
  DateTime eventDate;

  @HiveField(1)
  TimeOfDay eventTime;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  int iconCodePoint;

  DateTime get eDate {
    return eventDate;
  }

  TimeOfDay get eTime {
    return eventTime;
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

  Event(this.eventDate, this.eventTime, this.title, this.description,
      this.iconCodePoint);

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
