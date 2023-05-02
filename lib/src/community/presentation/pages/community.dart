import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/community_controller.dart';

class CommunityPage extends GetView<CommunityController> {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Community Page'),
    );
  }
}
