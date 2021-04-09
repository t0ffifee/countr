import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../constants/constants.dart';

part 'Event.g.dart';

// Titel (String), Beschrijving (String), Datum/Tijd (DateTime), Icoon (int), Kleur (int), ShowNotification (bool)

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

  // @HiveField(4)
  // Color eventColor;

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

  // Color get eColor {
  //   return eventColor;
  // }

  Event(this.eventDate, this.title, this.description, this.iconCodePoint); // this.eventColor);

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
