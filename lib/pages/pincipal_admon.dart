import 'package:crud_firebase_270623/pages/signin.dart';
import 'package:flutter/material.dart';

import 'firebase_user.dart';

class principal_admon extends StatefulWidget {

  principal_admon({Key? key}) : super(key: key);

  @override
  State<principal_admon> createState() => _principal_admonState();
}

class _principal_admonState extends State<principal_admon> {
  final FirebaseUser _user = FirebaseUser();
  final AuthServiceGoogle _auth = AuthServiceGoogle();

  void initState() {
    super.initState();
    _user.user = _auth.user;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade400,
      appBar: AppBar(
        title: const Text('Bienvenido Administrador'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOutGoogle().whenComplete(() {
                Navigator.pushNamed(context, '/principal');
              });
              setState(() {
                _user.user = _auth.user;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          child: GridView.count(
            crossAxisCount: 3,
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
                        image: AssetImage("assets/paselista.jpg"),
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
                        image: AssetImage("assets/control acceso.png"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Control de Acceso',
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
                        image: AssetImage("assets/reportes.jpeg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Reportes',
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
                        image: AssetImage("assets/notificaciones.jpg"),
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
                    Expanded(
                      //child: InkWell(
                        //onTap: () {
                          //Navigator.pushNamed(context, '/home');
                        //},
                        child: const Image(
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
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    const Expanded(
                      child: Image(
                        image: AssetImage("assets/cita.jpg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Cita',
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
                        image: AssetImage("assets/consultas.png"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Text('Consultas',
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
                        image: AssetImage("assets/reportes.jpeg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
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
                      padding: EdgeInsets.all(10),
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
}
