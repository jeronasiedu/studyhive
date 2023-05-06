import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String?> uploadImage({required String imagePath, String? folder}) async {
  try {
    File file = File(imagePath);
    final String fileName = file.path.split('/').last;
    FirebaseStorage storage = FirebaseStorage.instance;
    final path = folder != null ? '$folder/$fileName' : fileName;
    TaskSnapshot taskSnapshot = await storage.ref().child(path + DateTime.now().toString()).putFile(file);
    if (taskSnapshot.state == TaskState.success) {
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    }
    return null;
  } catch (e) {
    print('Error while uploading image to firebase storage: $e');
    return null;
  }
}
