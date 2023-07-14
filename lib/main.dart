import 'package:crud_firebase_270623/login_page/register.dart';
import 'package:crud_firebase_270623/pages/home_google_sign_in.dart';
import 'package:crud_firebase_270623/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Calendario/calendario.dart';
import 'firebase_options.dart';

// Pages
import 'package:crud_firebase_270623/pages/add_name_page.dart';
import 'package:crud_firebase_270623/pages/edit_name_page.dart';
import 'package:crud_firebase_270623/pages/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'login_page/ingreso.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Base de datos',
      initialRoute: '/principal',
      routes: {
        '/': (context) => const HomePage(),
        '/principal': (context) => principal(),
        '/home': (context) => const HomeGoogle(),
        '/add': (context) => const AddNamePage(),
        '/edit': (context) => const EditNamePage(),
        '/register': (context) =>  Register(),
        '/ingreso': (context) => const ingreso(),
        '/calendario': (context) => Calendario(createTodoDialog: null,),
      },
    );
  }
}
