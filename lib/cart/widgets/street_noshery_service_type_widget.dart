import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';
import 'package:street_noshery/common/common_theme.dart';

class StreetNosheryServiceTypeWidget
    extends GetView<StreetNosheryCartController> {
  const StreetNosheryServiceTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Obx(() {
      return Visibility(
      visible: controller.homeController.foodCartList.isNotEmpty,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 20), // Use margin instead of separate Padding
        width: Get.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Shadow color
              blurRadius: 6, // Blur radius
              spreadRadius: 2, // Spread radius
              offset: Offset(2, 4), // Shadow offset (x, y)
            ),
          ],
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: controller.serviceType.length,
          itemBuilder: (context, index) {
            final option = controller.serviceType[index]; // Current map item
            final key = option.keys.first; // Key (1 or 2)
            final value = option.values.first;
            return Obx(() {
              return ListTile(
                title: Text(value),
                leading: Radio<int>(
                  value: key,
                  activeColor: colors.lightMossgreen,
                  groupValue: controller.serviceOption.value,
                  onChanged: (selectedValue) {
                    if (selectedValue != null) {
                      print(selectedValue);
                      controller.serviceOption.value = selectedValue;
                      if (selectedValue == 3) {
                        _showBottomSheet(context);
                      }
                    }
                  },
                ),
              );
            });
          },
        ),
      ),
    );
    });
  }
}

void _showBottomSheet(BuildContext context) {
  final cartController = Get.find<StreetNosheryCartController>();
  showModalBottomSheet(
    context: context,
    builder: (context) {
      final colors = CommonTheme();
      return Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                    'Selected Date: ${cartController.selectedDate.value.isNotEmpty ? cartController.selectedDate.value : 'Not Selected'}'),
                trailing:
                    Icon(Icons.calendar_today, color: colors.darkLeafGreen),
                onTap: () {
                  cartController.selectDate(context);
                },
              ),
              ListTile(
                title: Text(
                    'Selected Time: ${cartController.selectedTime.isNotEmpty ? cartController.selectedTime.value : 'Not Selected'}'),
                trailing: Icon(
                  Icons.access_time,
                  color: colors.darkLeafGreen,
                ),
                onTap: () {
                  cartController.selectTime(context);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
