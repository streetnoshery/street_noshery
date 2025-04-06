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

  @override
  void onReady() async {
    await getOrderTrackingStatus();
  }

  Future<void> getOrderTrackingStatus() async {
    try {
      ApiResponse response = await StreetNosheryOrderTrackingProvider.getOrderStatus(arguments['orderTrackId']);
      if(response.data != null) {
        orderTrackingData.value = OrderTrackingData.fromJson(response.data);
        isOrderStatusResponseSuccess.value = true;
      }
    } catch (e) {
      rethrow;
    }
  }


}