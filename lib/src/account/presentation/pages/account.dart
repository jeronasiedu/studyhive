import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/profile_controller.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Account Page'),
    );
  }
}
