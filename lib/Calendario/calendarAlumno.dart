import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../pages/upload_image.dart';


class CalendarAl extends StatefulWidget {
  const CalendarAl({Key? key}) : super(key: key);

  @override
  State<CalendarAl> createState() => _CalendarAlState();
}

class _CalendarAlState extends State<CalendarAl> {

  @override
  void initState() {
    super.initState();
    Reference ref = storage.ref().child("Calendario");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendario Escolar"),
        centerTitle: true,
      ),

    );
  }
}
