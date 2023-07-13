import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'model.dart';

class monitor extends StatefulWidget {
  String id;

  monitor({required this.id});

  @override
  _monitorState createState() => _monitorState(id: id);
}

class _monitorState extends State<monitor> {
  String? id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _monitorState({required this.id});

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users") //.where('uid', isEqualTo: user!.uid)
        .doc(id)
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

  @override
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Monitor",
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(Icons.logout),
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
                        image: AssetImage("assets/calendario.jpg"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Calendario'),
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
                        image: AssetImage("assets/reportes.jpeg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Reportes'),
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
                        image: AssetImage("assets/control acceso.png"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Control de acceso'),
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
                        image: AssetImage("assets/notificaciones.jpg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Notificaciones'),
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
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Configuración'),
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
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/principal');
  }
}
