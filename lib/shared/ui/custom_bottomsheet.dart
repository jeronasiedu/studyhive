import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomBottomSheet({
  double? height,
  String? title,
  required Widget child,
  bool isScrollControlled = false,
  double horizontalPadding = 10,
}) {
  return Get.bottomSheet(
    SizedBox(
      height: height ?? Get.height * 0.25,
      child: Padding(
        padding: EdgeInsets.only(
          top: 6,
          left: horizontalPadding,
          right: horizontalPadding,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 55,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Get.theme.hintColor.withOpacity(0.2),
                ),
              ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    ),
    backgroundColor: Get.theme.colorScheme.background,
    isScrollControlled: isScrollControlled,
    elevation: 0,
  );
}

// show animated bottomsheet
showAnimatedBottomSheet() {
  return BottomSheet(
    onClosing: () {},
    backgroundColor: Colors.red,
    constraints: BoxConstraints(
      maxHeight: 200,
      minHeight: 200,
      minWidth: Get.width,
      maxWidth: Get.width,
    ),
    builder: (context) => Container(
        height: 200,
        width: 200,
        color: Colors.red,
        child: const Center(
          child: Text("Test"),
        )),
  );
}
