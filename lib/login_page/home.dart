import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Administrador.dart';
import 'model.dart';
import 'student.dart';
import 'teacher.dart';
import 'monitor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    return contro();
  }
}

class contro extends StatefulWidget {
  contro();

  @override
  _controState createState() => _controState();
}

class _controState extends State<contro> {
  _controState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var emaill;
  var id;
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
    return routing();
    Future.delayed(const Duration(milliseconds: 100));
  }
}
