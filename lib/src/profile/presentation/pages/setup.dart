import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/profile_controller.dart';

class SetupProfilePage extends GetView<ProfileController> {
  const SetupProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Setup Profile Page"),
      ),
    );
  }
}
