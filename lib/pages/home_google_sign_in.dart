import 'package:crud_firebase_270623/pages/pincipal_admon.dart';
import 'package:flutter/material.dart';
import 'firebase_user.dart';
import 'signin.dart';

class HomeGoogle extends StatefulWidget {
  const HomeGoogle({Key? key}) : super(key: key);

  @override
  State<HomeGoogle> createState() => _HomeGoogleState();
}

class _HomeGoogleState extends State<HomeGoogle> {
  final FirebaseUser _user = FirebaseUser();
  final AuthServiceGoogle _auth = AuthServiceGoogle();

  @override
  void initState() {
    super.initState();
    _user.user = _auth.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Colors.greenAccent.shade400,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/Syse logo.jpeg"),),
              //FlutterLogo(size: 150),
              SizedBox(height: 50),
              _user.uid != null ? _logged() : _login(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _login() {
    return ElevatedButton.icon(
      icon: Icon(Icons.login),
      label: Text('Ingresar'),
      onPressed: () async {
        await _auth.signInGoogle().whenComplete(() {
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => principal_admon()));
        });
        setState(() {
          _user.user = _auth.user;
        });
      },
    );
  }

  Column _logged() {
    return Column(
      children: [
        Container(
          child: CircleAvatar(
            backgroundImage: NetworkImage(_user.imageUrl!),
            radius: 50.0,
          ),
        ),
        Text(_user.name!),
        Text(_user.email!),
        ElevatedButton.icon(
          icon: Icon(Icons.home),
          label: Text('Base de Datos'),
          onPressed: () async {
            Navigator.pushNamed(context, '/');
            //await _auth.signOutGoogle();
            setState(() {
              //_user.user = _auth.user;
            });
          },
        ),
      ],
    );
  }
}
