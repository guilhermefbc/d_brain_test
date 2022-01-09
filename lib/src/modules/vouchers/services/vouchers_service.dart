import 'dart:io';

import 'package:d_brain_test/src/shared/repositories/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;


class VoucherServices {
  final firebase_storage.FirebaseStorage _storage = firebase_storage.FirebaseStorage.instance;
  final AuthFirebaseRepository _auth = AuthFirebaseRepository();

  _getRef(String dateNow) {
    String root = "users";
    String? userId = _auth.getUser()?.uid;
    String folder = "images";
    String fileName = 'img-$dateNow.jpg';

    return root + "/" + userId! + "/" + folder + "/" + fileName;
  }

  firebase_storage.SettableMetadata _getMetadata(String dateNow) {
    return firebase_storage.SettableMetadata(
      cacheControl: 'max-age=60',
      customMetadata: <String, String>{
        'date': dateNow,
      },
    );
  }

  Future<firebase_storage.UploadTask?> putPhoto(File photo) async {
    String date = DateTime.now().toString();

    try {
      return _storage.ref(_getRef(date)).putFile(photo, _getMetadata(date));
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }


}