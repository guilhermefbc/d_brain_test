import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_brain_test/src/modules/vouchers/controllers/voucher/voucher_controller.dart';
import 'package:d_brain_test/src/shared/repositories/auth_service.dart';


class VouchersFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthFirebaseRepository _auth = AuthFirebaseRepository();
  // FirebaseFirestore.instance.settings = Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  CollectionReference? _vouchers;

  VouchersFirestoreService(){
    _vouchers = _firestore.collection(_getRef());
  }

  disableNetworkAccess() {
    _firestore.disableNetwork();
  }

  enableNetworkAccess() {
    _firestore.enableNetwork();
  }

  _getRef() {
    String root = "users";
    String? userId = _auth.getUser()?.uid;
    String folder = "vouchers";

    return root + "/" + userId! + "/" + folder + "/";
  }

  putVoucher(VoucherController voucher) async {
        _vouchers?.add({
          'name': voucher.name,
          'date': voucher.date.toString(),
          'voucher': Blob((await voucher.file?.readAsBytes())!)
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List<Map<String, dynamic>>?> getAllVouchers() async {
    var snapshot = await _vouchers?.get();
    return snapshot?.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

}