import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  var selDate;
  var selTime;

  //Fecha
  void callDatePicker() async {
    var selectDate = await getDatePicker();
    setState(() {
      selDate = selectDate;
    });
  }

  Future<DateTime?> getDatePicker() {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2028),
    );
  }

  //Tiempo
  void callTimePicker() async {
    var selectTime = await getTimePicker();
    setState(() {
      selTime = selectTime;
    });
  }

  Future getTimePicker() {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: callDatePicker,
                child: Text('Fecha')),
            Text('$selDate'),
            ElevatedButton(
                onPressed: callTimePicker,
                child: Text('Hora')),
            Text('$selTime'),
          ],
        ),
      ),
    );
  }
}
