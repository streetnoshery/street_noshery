import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/common/common_theme.dart';
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
    final colorTheme = CommonTheme();
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
                      color: colorTheme.theme.veg, // Border color
                      width: 2, // Border width
                      style: BorderStyle.solid)),
              child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: colorTheme.theme.veg,
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
                style: TextStyle(
                    color: colorTheme.theme.textPrimary,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\u20B9 ${foodItem.price}",
              style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15),
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
                  color: colorTheme.theme.textGreen, // Icon color
                  size: 20, // Icon size
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "${double.parse(foodItem.rating?.toStringAsFixed(1) ?? "1")}",
                  style: TextStyle(fontSize: 15, color: colorTheme.theme.textGreen),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "(${foodItem.ratingCount})",
                  style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                StreetNosheryCommonBottomSheet.show(
                    child:  const StreetNosheryMenuMoreDetails());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: colorTheme.theme.textTer)),
                child: Text(
                  controller.streetNosheryMenuFirebaseStaticModel.menu?.moreDetail ?? "More Details >",
                  style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15),
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
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        "-",
                        style: TextStyle(color: colorTheme.theme.surface, fontSize: 20),
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
                        style: TextStyle(color: colorTheme.theme.surface, fontSize: 15),
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
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("+", style: TextStyle(color: colorTheme.theme.surface, fontSize: 15)),
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
