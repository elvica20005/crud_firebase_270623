import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Administrador.dart';
import 'model.dart';
import 'student.dart';
import 'teacher.dart';
import 'monitor.dart';

class PageControl extends StatelessWidget {
  const PageControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Control();
  }
}


class Control extends StatefulWidget {
  const Control({Key? key}) : super(key: key);

  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  _ControlState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll="";
  var emaill="";
  var id="";
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      const CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  routing() {
    if (rooll == 'Student') {
      return Student(
        id: id,
      );
    } else if (rooll == 'Teacher'){
      return Teacher(
        id: id,
      );
    } else if(rooll == 'Monitor'){
      return monitor(
        id: id,
      );
    } else if(rooll == 'Administrador'){
      return Administrador(
        id: id,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    const CircularProgressIndicator();
    Future.delayed(const Duration(milliseconds: 100));
    return routing();
  }
}


