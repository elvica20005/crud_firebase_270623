import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

// import 'package:crud/services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController autor = TextEditingController(text: "");
  TextEditingController editorial = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    nameController.text = arguments['name'];
    autor.text = arguments['autor'];
    editorial.text = arguments['editorial'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Actualice el nombre',
                ),
              ),
              TextField(
                controller: autor,
                decoration: const InputDecoration(
                  hintText: 'Actualice el autor',
                ),
              ),
              TextField(
                controller: editorial,
                decoration: const InputDecoration(
                  hintText: 'Actualice editorial',
                ),
              ),
              Text(
                arguments['uid'],
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await updatePeople(arguments['uid'], nameController.text,
                            autor.text, editorial.text)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Actualizar"))
            ],
          ),
        ),
      ),
    );
  }
}
