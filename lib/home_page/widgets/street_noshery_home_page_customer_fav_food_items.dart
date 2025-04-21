import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';
import 'package:street_noshery/routes/app_pages.dart';

// ignore: must_be_immutable
class BestSellerFoodItems extends StatelessWidget {
  int index;
  BestSellerFoodItems({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final streetNosheryHomeController =
        Get.isRegistered<StreetNosheryHomeController>()
            ? Get.find<StreetNosheryHomeController>()
            : Get.put(StreetNosheryHomeController());
    final favFoodData = streetNosheryHomeController.bestSeller;
    final colors = CommonTheme();
    return SizedBox(
      width: 150,
      height: 350,
      child: InkWell(
        onDoubleTap: () {
          streetNosheryHomeController.removeFromCart(
              favFoodData[index].dishName ?? "");
          streetNosheryHomeController.updateCartAmount(
              int.tryParse(favFoodData[index].price ?? "0") ?? 0, UpdatePrice.add);
          Fluttertoast.showToast(
              msg: "${favFoodData[index].dishName} is removed from cart",
              toastLength:
                  Toast.LENGTH_SHORT, // Duration: LENGTH_SHORT or LENGTH_LONG
              gravity: ToastGravity.BOTTOM, // Position: TOP, BOTTOM, CENTER
              timeInSecForIosWeb: 1, // Duration for iOS and Web
              backgroundColor: Colors.black, // Background color
              textColor: Colors.white, // Text color
              fontSize: 16.0 // Font size
              );
        },
        onTap: () {
          streetNosheryHomeController.addAllItemsToCart([favFoodData[index]]);
          Get.toNamed(Routes.cart);
        },
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 12,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    streetNosheryHomeController.streetNosheryHomePageFirebaseModel.homePageBestSeller?.subTitle ?? "Special Meal",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "${favFoodData[index].dishName}",
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Image.asset(
                  favFoodData[index].image ?? "",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\u20B9 ${favFoodData[index].price}",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${double.parse(favFoodData[index].rating?.toStringAsFixed(1) ?? "1")}",
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star, // Star icon
                            color: colors.yellowStar, // Icon color
                            size: 20, // Icon size
                          ),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
