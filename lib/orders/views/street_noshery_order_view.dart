import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_date_format.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/orders/models/street_noshery_shop_order_model.dart';

class StreetNosheryOrderView extends GetView<StreetNosheryHomeController> {
  const StreetNosheryOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final orderItem = controller.orders[index];
          return OrderView(order: orderItem);
        }, 
        separatorBuilder: (context, index) {
          return const Divider(thickness: 0.5,);
        }, 
        itemCount: controller.orders.length);
    });
  }
  
}

class OrderView extends GetView<StreetNosheryHomeController> {
  final StreetNosheryShopOrders? order;
  const OrderView({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${order?.orderItems?[0].dishName}, ${order?.orderItems?[1].dishName ?? ""}...",
                style: TextStyle(color: Colors.grey.shade900, fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          Text(
            DateFormatter().orderDateFormat(order?.orderPlacedAt),
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () async {
                    final orderTrackId = order?.orderTrackId;
                    final getStatus = controller.statusTobeUpdated(order?.orderStatus ?? "");
                    showLoader();
                    await controller.updateOrder(orderTrackId, getStatus);
                    hideLoader();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white),
                    child: const Text(
                      "UPDATE",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    final orderTrackId = order?.orderTrackId;
                    const getStatus = "CANCELLED";
                    showLoader();
                    controller.updateOrder(orderTrackId, getStatus);
                    hideLoader();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white),
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}