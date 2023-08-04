import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage (File file) async {
  final String namefile = file.path.split("/").last;
  final Reference ref = storage.ref().child("Calendario").child(namefile);
  final UploadTask uploadTask = ref.putFile(file);
  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

  if (snapshot.state == TaskState.success) {
    return true;
  } else {
    return false;
  }
}