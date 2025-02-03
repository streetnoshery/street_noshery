import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_home_page_static_data.model.dart';

class FirebaseHelper extends GetxController{
  StreetNosheryHomePageFireBaseModel streetNosheryHomePageFireBaseModel = StreetNosheryHomePageFireBaseModel();

  @override
  void onInit() async {
    await _setStaticData();
    super.onInit();
  }

  static Future create(dynamic data) async {
    try {
      final firebaseCollection =
          FirebaseFirestore.instance.collection("appConfig");

      final docRef = firebaseCollection.doc();

      final homeData = data.toJson();

      await docRef.set(homeData);

      print(docRef);
    } catch (error) {
      print(error);
    }
  }

  static Future getData(String collectionName, String docName) async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(docName)
          .get();
      
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        log(data.toString());
        return data;
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<StreetNosheryHomePageFireBaseModel> _getHomeStaticData() async {
    final streetNosheryHomeStaticData = await getData("appConfig", "street_noshery_home_page");
    return StreetNosheryHomePageFireBaseModel.fromJson(streetNosheryHomeStaticData);
  }

  Future<void> _setStaticData() async {
    streetNosheryHomePageFireBaseModel = await _getHomeStaticData();
  }
}
