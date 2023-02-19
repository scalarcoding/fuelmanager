import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fuelmanager/models/user_model.dart';
import 'package:fuelmanager/widgets/custom_snackbar.dart';

class FirebaseDB {
  static Future<String> registeringUser(NewUserModel newUserModel) async {
    try {
      FirebaseFirestore.instance
          .collection('new_registrant')
          .add(NewUserModel.toMap(newUserModel));
    } catch (e) {
      return e.toString();
    }
    return "success";
  }

  static Future<String> injectUser(AppUserData appUserData) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(appUserData.ID)
          .set(AppUserData.toRegistrationMap(appUserData));
    } catch (e) {
      return e.toString();
    }
    return "success";
  }

  static Future<String> checkUser(AppUserData appUserData) async {
    bool exist = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: appUserData.ID)
        .snapshots()
        .first
        .then((value) {
      return value.docs.first.exists;
    });

    if (exist == false) {
      return "not found";
    } else {
      return "found";
    }
  }
}
