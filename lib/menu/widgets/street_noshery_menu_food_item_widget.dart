import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';
import 'package:street_noshery/menu/controller/street_noshery_menu_controller.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';
import 'package:street_noshery/menu/widgets/street_noshery_menu_more_details_bottomsheet.dart';

// ignore: must_be_immutable
class StreetnosheryMenuItems extends GetView<StreetNosheryMenuController> {
  MenuItem foodItem;
  StreetnosheryMenuItems(
      {super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: Border.all(
                      color: Colors.green.shade700, // Border color
                      width: 2, // Border width
                      style: BorderStyle.solid)),
              child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width *
                  0.4, // Specify width or wrap in Flexible if inside a limited space
              child: Text(
                "${foodItem.dishName}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\u20B9 ${foodItem.price}",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star, // Star icon
                  color: Colors.green.shade800, // Icon color
                  size: 15, // Icon size
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "${foodItem.rating ?? 0}",
                  style: TextStyle(fontSize: 15, color: Colors.green.shade800),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "(50)",
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                print("View more");
                StreetNosheryCommonBottomsheet().showCustomBottomSheet(
                    context, const StreetNosheryMenuMoreDetails());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey.shade400)),
                child: Text(
                  controller.streetNosheryMenuFirebaseStaticModel.menu?.moreDetail ?? "More Details >",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Container(
              height: Get.width * 0.3,
              width: Get.width * 0.3,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.homeController.removeFromCart(
                          foodItem.dishName ?? "");
                      controller.homeController.updateCartAmount(
                          int.tryParse(foodItem.price ?? "0") ?? 0, UpdatePrice.removed);
                      controller.removeditems(foodItem.foodId);
                      Fluttertoast.showToast(
                          msg: "${foodItem.dishName} is removed from cart",
                          toastLength: Toast
                              .LENGTH_SHORT, // Duration: LENGTH_SHORT or LENGTH_LONG
                          gravity: ToastGravity
                              .BOTTOM, // Position: TOP, BOTTOM, CENTER
                          timeInSecForIosWeb: 1, // Duration for iOS and Web
                          backgroundColor: Colors.black, // Background color
                          textColor: Colors.white, // Text color
                          fontSize: 16.0 // Font size
                          );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: (foodItem.count ?? 0) > 0,
                    child: Center(
                      child: Text(
                        "${foodItem.count}",
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      controller.homeController.addAllItemsToCart([foodItem]);
                      controller.updateItems(foodItem.foodId);
                      Fluttertoast.showToast(
                          msg: "${foodItem.dishName} is added to cart",
                          toastLength: Toast
                              .LENGTH_SHORT, // Duration: LENGTH_SHORT or LENGTH_LONG
                          gravity: ToastGravity
                              .BOTTOM, // Position: TOP, BOTTOM, CENTER
                          timeInSecForIosWeb: 1, // Duration for iOS and Web
                          backgroundColor: Colors.black, // Background color
                          textColor: Colors.white, // Text color
                          fontSize: 16.0 // Font size
                          );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("+", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
