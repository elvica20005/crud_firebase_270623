import 'dart:io';

import 'package:crud_firebase_270623/pages/add_name_page.dart';
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child: const Text("Subir imagen"))
            ],
          ),
        ],
      ),
    );
  }
}
