import 'package:crud_firebase_270623/attendance/add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'mainpage.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: "",
//         authDomain: "",
//         projectId: "",
//         storageBucket: "",
//         messagingSenderId: "",
//         appId: "",
//         measurementId: "",
//       ),
//     );
//   } else {
//   await Firebase.initializeApp();
//   }
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Attendance app',
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

class mainlista extends StatefulWidget {
  const mainlista({super.key});

  @override
  State<mainlista> createState() => _mainlistaState();
}

class _mainlistaState extends State<mainlista> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pase de lista'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              // height: 50,
              // width: w,
              child: MaterialButton(
                color: const Color.fromARGB(255, 2, 0, 133),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mainpage(),
                    ),
                  );
                },
                child: const Text(
                  'Asistencia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              // height: 50,
              // width: w,
              child: MaterialButton(
                color: const Color.fromARGB(255, 2, 0, 133),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => add(),
                    ),
                  );
                },
                child: const Text(
                  'Añadir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
