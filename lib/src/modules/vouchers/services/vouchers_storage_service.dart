import 'dart:io';

import 'package:d_brain_test/src/shared/repositories/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;


class VouchersStorageService {
  final firebase_storage.FirebaseStorage _storage = firebase_storage.FirebaseStorage.instance;
  final AuthFirebaseRepository _auth = AuthFirebaseRepository();

  _getRef() {
    String root = "users";
    String? userId = _auth.getUser()?.uid;
    String folder = "images";

    return root + "/" + userId! + "/" + folder + "/";
  }

  String _getFileName(String dateNow) {
    return "img-$dateNow.jpg";
  }

  firebase_storage.SettableMetadata _getMetadata(String dateNow) {
    return firebase_storage.SettableMetadata(
      cacheControl: 'max-age=60',
      customMetadata: <String, String>{
        'date': dateNow,
      },
    );
  }

  firebase_storage.UploadTask? putPhoto(File photo, String date) {

    try {
      return _storage.ref(_getRef() + _getFileName(date)).putFile(photo, _getMetadata(date));
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }

  Future<List<Map<String,String?>>> getAllVouchersRefs() async {
    List<firebase_storage.Reference> refs = [];
    List<Map<String,String?>> vouchersData = [];
    
    refs = (await _storage.ref(_getRef()).listAll()).items;

    for (firebase_storage.Reference ref in refs) {
      String? link = await ref.getDownloadURL();
      firebase_storage.FullMetadata metadata = await ref.getMetadata();
      String? date = metadata.customMetadata?["date"];

      vouchersData.add({
        "date": date,
        "link": link
      });
    }
    
    return vouchersData;
  }

}