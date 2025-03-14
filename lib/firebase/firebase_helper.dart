import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_account_setting_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_address.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_cart_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_help_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_home_page_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_menu_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_profile_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_review_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_shops_firebase_model.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';

class FirebaseHelper extends GetxController {
  StreetNosheryHomePageFireBaseModel streetNosheryHomePageFireBaseModel =
      StreetNosheryHomePageFireBaseModel();
  StreetNosheryProfileFireBaseModel streetNosheryProfileFireBaseModel =
      StreetNosheryProfileFireBaseModel();
  StreetNosheryMenuFirebaseModel streetNosheryMenuFireBasemodel =
      StreetNosheryMenuFirebaseModel();
  StreetNosheryCartFirebaseStaticDataModel streetNosheryCartFirebaseModel =
      StreetNosheryCartFirebaseStaticDataModel();
  NotificationSettings streetNosheryAccountSettingFirebaseModel =
      NotificationSettings();
  StreetNosheryFirebaseModel streetNosheryAddressFirebaseModel =
      StreetNosheryFirebaseModel();
  StreetNosheryReviewFirebaseModel streetNosheryReviewFirebaseModel =
      StreetNosheryReviewFirebaseModel();
  StreetNosheryHelpAndSupportFirebasemodel
      streetNosheryHelpAndSupportFirebaseModel =
      StreetNosheryHelpAndSupportFirebasemodel();
  List<StreetNosheryShopsModelShop> streetNosheryShopsFirebaseData = [];
  StreetNosheryUser userData = StreetNosheryUser();


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

  static Future getData(String collectionName, [String? docName]) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      if (docName != null && docName.isNotEmpty) {
        // Fetch a single document
        final DocumentSnapshot snapshot =
            await firestore.collection(collectionName).doc(docName).get();

        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>?;
          return data; // Return a list with a single document
        } else {
          print("Document does not exist");
          return null;
        }
      } else {
        // Fetch all documents in the collection
        final QuerySnapshot snapshot =
            await firestore.collection(collectionName).get();
        final List<Map<String, dynamic>> documents = snapshot.docs
            .map((doc) => {
                  "id": doc.id,
                  ...doc.data() as Map<String, dynamic>
                }) // Add doc ID
            .toList();

        return documents;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<void> listenToFirebase(String collectionName, String? documentName) async {
    try {
      FirebaseFirestore.instance
        .collection(collectionName) // Firestore collection
        .doc(documentName)   // Specific document
        .snapshots()
        .listen((snapshot) async {
      if (snapshot.exists) {
        userData = StreetNosheryUser.fromJson(snapshot.data() as Map<String, dynamic>);
        final fireBaseContentHandler = Get.isRegistered<StreetNosheryOnboardingController>()
      ? Get.find<StreetNosheryOnboardingController>()
      : Get.put(StreetNosheryOnboardingController());
      fireBaseContentHandler.streetNosheryUserData.value = userData;
      await fireBaseContentHandler.onboardingStates();
      }
    });
    } catch (e) {
      throw e;
    }
  }

  Future<StreetNosheryHomePageFireBaseModel> _getHomeStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_home_page");
    return StreetNosheryHomePageFireBaseModel.fromJson(
        streetNosheryHomeStaticData);
  }

  Future<StreetNosheryProfileFireBaseModel> _getprofileStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_profile");
    return StreetNosheryProfileFireBaseModel.fromJson(
        streetNosheryHomeStaticData);
  }

  Future<StreetNosheryMenuFirebaseModel> _getMenuStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_menu");
    return StreetNosheryMenuFirebaseModel.fromJson(streetNosheryHomeStaticData);
  }

  Future<StreetNosheryCartFirebaseStaticDataModel> _getCartStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_cart");
    return StreetNosheryCartFirebaseStaticDataModel.fromJson(
        streetNosheryHomeStaticData);
  }

  Future<NotificationSettings> _getAccountSettingStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_account_setting");
    return NotificationSettings.fromJson(streetNosheryHomeStaticData);
  }

  Future<StreetNosheryFirebaseModel> _getAddressStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_address");
    return StreetNosheryFirebaseModel.fromJson(streetNosheryHomeStaticData);
  }

  Future<StreetNosheryReviewFirebaseModel> _getReviewStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_review");
    return StreetNosheryReviewFirebaseModel.fromJson(
        streetNosheryHomeStaticData);
  }

  Future<StreetNosheryHelpAndSupportFirebasemodel> _getHelpStaticData() async {
    final streetNosheryHomeStaticData =
        await getData("appConfig", "street_noshery_help");
    return StreetNosheryHelpAndSupportFirebasemodel.fromJson(
        streetNosheryHomeStaticData);
  }

  Future<List<StreetNosheryShopsModelShop>> _getServicableAddresses() async {
    final streetNosheryHomeStaticData = await getData("shops");
    // Parsing a list of JSON objects into a Dart List

    return parseShops(streetNosheryHomeStaticData);
  }

  // Parsing a list of JSON objects into a Dart List
  List<StreetNosheryShopsModelShop> parseShops(List<dynamic> jsonList) {
    return jsonList
        .map((json) => StreetNosheryShopsModelShop.fromJson(json))
        .toList();
  }

  Future<void> _getUserData(String? documentName) async {
    await listenToFirebase("customers", documentName);
  }

  Future<void> _setStaticData() async {
    streetNosheryHomePageFireBaseModel = await _getHomeStaticData();
    streetNosheryProfileFireBaseModel = await _getprofileStaticData();
    streetNosheryMenuFireBasemodel = await _getMenuStaticData();
    streetNosheryCartFirebaseModel = await _getCartStaticData();
    streetNosheryAccountSettingFirebaseModel =
        await _getAccountSettingStaticData();
    streetNosheryAddressFirebaseModel = await _getAddressStaticData();
    streetNosheryReviewFirebaseModel = await _getReviewStaticData();
    streetNosheryHelpAndSupportFirebaseModel = await _getHelpStaticData();
    streetNosheryShopsFirebaseData = await _getServicableAddresses();
  }

  Future<void> userFirebaseData(String documentName) async {
    await _getUserData(documentName);
  }
}
