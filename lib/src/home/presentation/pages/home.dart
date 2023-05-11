import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletons/skeletons.dart';
import 'package:studyhive/routes/app_pages.dart';
import 'package:studyhive/shared/extensions/strings.dart';
import 'package:studyhive/shared/ui/custom_listtile.dart';
import 'package:studyhive/src/home/presentation/manager/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "STUDY HIVE",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              splashRadius: 22,
              onPressed: () {
                Get.toNamed(AppRoutes.settings);
              },
              icon: const Icon(IconlyLight.setting),
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: controller.list(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SkeletonItem(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  return SkeletonListTile(
                    titleStyle: const SkeletonLineStyle(
                      height: 8,
                      randomLength: true,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    subtitleStyle: const SkeletonLineStyle(
                      randomLength: true,
                      height: 8,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    leadingStyle: const SkeletonAvatarStyle(
                      shape: BoxShape.circle,
                    ),
                    hasSubtitle: true,
                    hasLeading: true,
                  );
                },
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final hive = snapshot.data![index];
                return CustomListTile(
                  leading: hive.photoUrl == null ? Text(hive.name.initials) : null,
                  url: hive.photoUrl,
                  onTap: () {
                    Get.toNamed('/hive/${hive.id}', arguments: hive);
                  },
                  subtitle: "This is hive ${index + 1}",
                  title: hive.name,
                  trailing: Icon(
                    IconlyLight.arrow_right_3,
                    color: Get.theme.primaryColor,
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'create',
        onPressed: () {
          Get.toNamed(AppRoutes.createHive);
        },
        child: const Icon(IconlyLight.plus),
      ),
    );
  }
}
