import '../pages/pincipal_admon.dart';
import 'StudentList.dart';
import 'posts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'model.dart';

class Teacher extends StatefulWidget {
  String id;
  Teacher({required this.id});
  @override
  _TeacherState createState() => _TeacherState(id: id);
}

class _TeacherState extends State<Teacher> {
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _TeacherState({required this.id});
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      CircularProgressIndicator();
      setState(() {
        emaill = loggedInUser.email.toString();
        rooll = loggedInUser.wrool.toString();
        id = loggedInUser.uid.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade400,
      appBar: AppBar(
        title: const Text(
          "Docente",
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(40),
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/calendario.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Calendario escolar',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/paselista.png"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Pase de Lista',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/notificaciones.png"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Notificaciones',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/actividades.png"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Actividades',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/confiuracion.png"),
                      ),
                    ),
                    //),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Configuración',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.pushNamed(context, '/principal');


  }
}
