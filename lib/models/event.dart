import 'package:flutter/material.dart';

class CalendarEvent {
  final DateTime date;
  final String title;
  final num amount;
  final Widget icon;

  CalendarEvent({this.date, this.title, this.icon, this.amount}) : assert(date != null && amount != null && title != null);
}