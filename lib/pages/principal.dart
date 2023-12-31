import 'package:flutter/material.dart';

class principal extends StatefulWidget {
  const principal({Key? key}) : super(key: key);

  @override
  State<principal> createState() => _principalState();
}

class _principalState extends State<principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade400,
      appBar: AppBar(
        title: const Text('Syse COBAEH Zapotlán'),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/ingreso');
                          },
                          child: const Image(
                            image: AssetImage("assets/alumno.png"),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Alumno'),
                      ),
                    ],
                  ),
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
                        image: AssetImage("assets/tutor.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Tutor'),
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
                          Navigator.pushNamed(context, '/ingreso');
                        },
                        child: const Image(
                          image: AssetImage("assets/docente.png"),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Docente'),
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
                          Navigator.pushNamed(context, '/ingreso');
                        },
                        child: const Image(
                          image: AssetImage("assets/monitor.png"),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Monitor'),
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
                        image: AssetImage("assets/encargado de orden.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Encargado de orden'),
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
                        image: AssetImage("assets/psicologo.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Psicologo'),
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
                          Navigator.pushNamed(context, '/ingreso');
                        },
                        child: const Image(
                          image: AssetImage("assets/administrador.png"),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text('Administrador'),
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
