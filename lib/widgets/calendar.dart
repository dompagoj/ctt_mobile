import 'package:ctt_mobile/instances.dart';
import 'package:ctt_mobile/main.dart';
import 'package:ctt_mobile/models/event.dart';
import 'package:ctt_mobile/services/auth_service.dart';
import 'package:ctt_mobile/services/hours_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import "package:collection/collection.dart";

class CalendarContainer extends StatelessWidget {
  final authService = getIt.get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myDrawer,
        appBar: AppBar(
          title: Text("Simple time table"),
        ),
        body: FutureBuilder(
          future: hoursService.getHours(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (snapshot.hasData) {
              return _Calendar(snapshot.data);
            } else {
              return Center(child: Text('Failed'));
            }
          },
        ));
  }
}

class _Calendar extends StatefulWidget {
  final List<dynamic> events;

  _Calendar(this.events);

  @override
  _CalendarState createState() => _CalendarState(events);
}

class _CalendarState extends State<_Calendar> {
  final List<dynamic> _events;
  DateTime _currentDate = DateTime.now();
  String _currentMonth = '';
  static Widget _hoursIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: Icon(
      Icons.timer,
      color: Colors.amber,
    ),
  );

  _CalendarState(this._events);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel<CalendarEvent>(
          onDayPressed: (DateTime date, List<CalendarEvent> events) {
            this.setState(() => _currentDate = date);
            events.forEach((event) => print(event.title));
            _showDialog(date, events);
          },
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
          weekFormat: false,
          markedDateIconBuilder: (event) {
            return event.icon;
          },
          markedDatesMap: _markedDateMap(),
          height: 420.0,
          selectedDateTime: _currentDate,
          markedDateShowIcon: true,
          markedDateIconMaxShown: 2,
          daysHaveCircularBorder: null,
          markedDateMoreShowTotal: false),
    );
  }

  EventList<CalendarEvent> _markedDateMap() {
    final grouped = groupBy(_events, (event) => event['date']);
    Map<DateTime, List<CalendarEvent>> events = {};

    grouped.forEach((k, v) => {
          events[DateTime.parse(k)] = v
              .map((h) => CalendarEvent(
                    icon: _hoursIcon,
                    title: h['description'],
                    amount: h['amount'],
                    date: DateTime.parse(k),
                  ))
              .toList()
        });

    return EventList<CalendarEvent>(
      events: events,
    );
  }

  void _showDialog(DateTime date, List<CalendarEvent> events) {
    print('Showing dialog?');
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            title: Text('Hours for ${date.day}/${date.month}'),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Description',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Text(
                          'Hours',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: events.map((e) => Padding(
                      padding: EdgeInsets.only(left: 20, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(e.title.length > 10 ? e.title.substring(0, 10) + '...' : e.title),
                          Text(e.amount.toString()),
                        ],
                      )),
                    ).toList(),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
