import 'package:flutter/material.dart';
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
    var box = Hive.box(eventBox);
    List<Event> eventsList = box.get(eventsKey, defaultValue: List<Event>());
    eventsList.add(this);
    box.put(eventsKey, eventsList);
    print("List is saved in Hive: $eventsList");
  }
}
