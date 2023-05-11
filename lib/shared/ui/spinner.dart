// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Spinner extends StatelessWidget {
  const Spinner({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);
  final SpinnerSize? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double spinSize = 45;
    if (size == SpinnerSize.sm) {
      spinSize = 20;
    } else if (size == SpinnerSize.md) {
      spinSize = 30;
    } else if (size == SpinnerSize.lg) {
      spinSize = 60;
    }

    return SizedBox.square(
      dimension: spinSize,
      child: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Get.theme.colorScheme.primary),
          strokeWidth: 2.5,
          backgroundColor: Platform.isIOS ? Get.theme.colorScheme.primary : null,
          value: null,
          semanticsLabel: 'Loading',
        ),
      ),
    );
  }
}

enum SpinnerSize { sm, md, lg }
