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
        children: const [
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 12.0),
          //   child: Card(
          //     color: Colors.white,
          //     child: Column(
          //       children: [
          //         ListTile(
          //           title: const Text("Tasks"),
          //           onTap: () {},
          //           contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          //           leading: const Icon(IconlyLight.paper),
          //           iconColor: Theme.of(context).colorScheme.tertiary,
          //           trailing: Text(
          //             '6',
          //             style: Theme.of(context).textTheme.titleMedium,
          //           ),
          //         ),
          //         const Divider(
          //           height: 0,
          //         ),
          //         ListTile(
          //           title: const Text("Today"),
          //           onTap: () {},
          //           contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          //           leading: const Icon(IconlyLight.calendar),
          //           iconColor: Theme.of(context).colorScheme.error,
          //         ),
          //         const Divider(
          //           height: 0,
          //         ),
          //         ListTile(
          //           title: const Text("Inbox"),
          //           onTap: () {},
          //           contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          //           leading: const Icon(IconlyLight.message),
          //           trailing: Text(
          //             '2',
          //             style: Theme.of(context).textTheme.titleMedium,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // ExpansionPanelList(
          //   elevation: 0,
          //   children: [
          //     ExpansionPanel(
          //       isExpanded: true,
          //       headerBuilder: (BuildContext context, bool isExpanded) {
          //         return const ListTile(
          //           title: Text("Favorites"),
          //         );
          //       },
          //       body: ListView.separated(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         padding: const EdgeInsets.all(16.0),
          //         itemCount: 5,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Card(
          //             child: ListTile(
          //               onTap: () {},
          //               title: Text('Item ${index + 1}'),
          //             ),
          //           );
          //         },
          //         separatorBuilder: (BuildContext context, int index) {
          //           return const Padding(padding: EdgeInsets.only(bottom: 5));
          //         },
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(IconlyLight.plus),
        onPressed: () {},
      ),
    );
  }
}
