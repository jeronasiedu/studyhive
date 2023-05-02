import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomBottomSheet({
  double? height,
  String? title,
  required Widget child,
  bool isScrollControlled = false,
  bool hasHorizontalPadding = true,
}) {
  return Get.bottomSheet(
    SizedBox(
      height: height ?? Get.height * 0.25,
      child: Padding(
        padding: EdgeInsets.only(
          top: 6,
          left: hasHorizontalPadding ? 10 : 0,
          right: hasHorizontalPadding ? 10 : 0,
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
