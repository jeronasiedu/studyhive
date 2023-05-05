import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/src/home/presentation/manager/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            splashRadius: 22,
            onPressed: () {},
            icon: const Icon(IconlyLight.search),
          ),
          IconButton(
            splashRadius: 22,
            onPressed: () {},
            icon: const Icon(IconlyLight.notification),
          ),
          IconButton(
            splashRadius: 22,
            onPressed: () {},
            icon: const Icon(IconlyLight.setting),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(IconlyLight.plus),
        onPressed: () {},
      ),
    );
  }
}
