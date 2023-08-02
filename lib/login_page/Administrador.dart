import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase_270623/attendance/main_lista.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controlacceso/today_screen.dart';
import 'model.dart';

class Administrador extends StatefulWidget {
  String id;

  Administrador({required this.id});

  _AdministradorState createState() => _AdministradorState(id: id);
}

class _AdministradorState extends State<Administrador> {
  String id;
  var rooll;
  var emaill;
  UserModel loggedInUser = UserModel();

  _AdministradorState({required this.id});

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
          "Administrador",
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
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/calendario');
                        },
                        child: const Image(
                          image: AssetImage("assets/calendario.png"),
                        ),
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
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) => mainlista()));
                        },
                        child: Image(
                          image: AssetImage("assets/paselista.png"),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
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
                     Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) => const TodayScreen()));
                        },
                        child: const Image(
                          image: AssetImage("assets/control acceso.png"),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Control de Acceso'),
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
                        image: AssetImage("assets/reportes.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child:
                      const Text('Reportes', textAlign: TextAlign.center),
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
                      padding: const EdgeInsets.all(10),
                      child: const Text('Notificaciones'),
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
                      padding: const EdgeInsets.all(10),
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
                      //child: InkWell(
                      //onTap: () {
                      //Navigator.pushNamed(context, '/home');
                      //},
                      child: Image(
                        image: AssetImage("assets/confiuracion.png"),
                      ),
                    ),
                    //),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Configuración',
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
                        image: AssetImage("assets/cita.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Cita'),
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
                        image: AssetImage("assets/consultas.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child:
                      const Text('Consultas', textAlign: TextAlign.center),
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
                        image: AssetImage("assets/reportes.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Registro de Alumnos',
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
                        image: AssetImage("assets/buscar.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Buscar Expediente',
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
