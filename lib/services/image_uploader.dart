import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class ImageUploader {
  static CollectionReference imgRef =
      FirebaseFirestore.instance.collection('images');

  static Future<String> uploadFile(
      File? img, String dateData, String key) async {
    var ref = FirebaseStorage.instance
        .ref()
        .child('images/$dateData/${p.basename(img!.path)}');
    String url = '';

    await ref.putFile(img).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        imgRef.doc(dateData).get().then((ds) {
          if (ds.exists) {
            ds.reference.update({key: value});
          } else {
            ds.reference.set({key: value});
          }
        });
        url = value;
      });
    });
    return url;
  }
}
