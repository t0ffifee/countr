class Event {
  String eventTitle;
  DateTime eventDate;
  // Color eventColor

  Event(String title, DateTime date) {
    this.eventTitle = title;
    this.eventDate = date;
  }

  String getTitle() {
    return eventTitle;
  }

  DateTime getDate() {
    return eventDate;
  }

  void setTitle(String title) {
    this.eventTitle = title;
  }

  void setDate(DateTime date) {
    this.eventDate = date;
  }
}
