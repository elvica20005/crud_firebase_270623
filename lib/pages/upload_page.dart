import 'dart:io';
import 'package:crud_firebase_270623/pages/newactivity.dart';
import 'package:crud_firebase_270623/pages/upload_image.dart';
import 'package:flutter/material.dart';
import '../services/pick_images.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageFile != null ? Image.file(imageFile!) : Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  color: Colors.blueGrey,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final file = await getImageFromGallery();
                          setState(() {
                            imageFile = File(file!.path);
                          });
                        },
                        child: const Text("Seleccionar imagen")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () async {
                          if(imageFile == null) {
                            return;
                          }

                          final uploaded = await uploadImage(imageFile!);
                          if(uploaded) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Imagen subida correctamente")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Error al subir la imagen")));
                          }
                          //Navigator.pop(context);
                        },
                        child: const Text("Subir imagen"))
                  ],
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                          (context) => const Nueva()));
                    },
                    child: const Text('Nueva Actividad')),
              ],
            ),
          ),
        ),
    );

  }
}
