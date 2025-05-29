import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/order_tracking/model/street_noshery_order_tracking_status_response_model.dart';
import 'package:street_noshery/order_tracking/provider/street_noshery_order_tracking_provider.dart';

class StreetNosheryOrderTrackingController extends GetxController{
  final arguments = Get.arguments;
  final isOrderStatusResponseSuccess = false.obs;
  Rx<OrderTrackingData> orderTrackingData = OrderTrackingData().obs;
  final allImages = CommonImages();
  StreetNosheryOrderTrackingProvider streetNosheryOrderTrackingProvider = StreetNosheryOrderTrackingProvider();

  @override
  void onReady() async {
    await getOrderTrackingStatus();
  }

  Future<void> getOrderTrackingStatus() async {
    try {
      RepoResponse response = await streetNosheryOrderTrackingProvider.getOrderStatus(arguments['orderTrackId']);
      if(response.data != null) {
        orderTrackingData.value = response.data;
        isOrderStatusResponseSuccess.value = true;
      }
    } catch (e) {
      rethrow;
    }
  }
}