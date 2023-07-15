//import 'dart:html';
import 'dart:io';

import 'package:crud_firebase_270623/pages/upload_page.dart';
import 'package:crud_firebase_270623/services/pick_images.dart';
import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  File? imageFile;
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController autor = TextEditingController(text: "");
  TextEditingController editorial = TextEditingController(text: "");
  TextEditingController imagen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar libro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Ingrese el nombre',
                ),
              ),
              TextField(
                controller: autor,
                decoration: const InputDecoration(
                  hintText: 'Ingrese el autor',
                ),
              ),
              TextField(
                controller: editorial,
                decoration: const InputDecoration(
                  hintText: 'Ingrese editorial',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: imageFile != null
                    ? Image.file(imageFile!)
                    : const Center(child: Text("No hay imagen")),
              ),
              const SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        final file = await getImageFromGallery();
                        setState(() {
                          imageFile = file;
                        });
                      },
                      child: const Text("Seleccionar imagen")),
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    await addPeople(
                            nameController.text, autor.text, editorial.text, imagen.text)
                        .then((_) {
                      Navigator.pop(context);
                      Future.delayed(Duration(milliseconds: 100));
                    });
                  },
                  child: const Text("Guardar"))
            ],
          ),
        ),
      ),
    );
  }
}
