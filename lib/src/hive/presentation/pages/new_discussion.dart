import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:open_filex/open_filex.dart';
import 'package:studyhive/shared/theme/theme.dart';
import 'package:studyhive/src/hive/presentation/manager/discussions_controller.dart';

import '../../../../shared/utils/generate_file_icon.dart';

class NewDiscussionPage extends GetView<DiscussionsController> {
  const NewDiscussionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Obx(() {
              return ElevatedButton(onPressed: controller.canPost.value ? () {} : null, child: const Text("Post"));
            }),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Icon(
                      IconlyLight.user_1,
                      size: 19,
                    ),
                  ),
                  Text(
                    "Private to My Hive",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0, right: 16, left: 16),
              child: TextFormField(
                controller: controller.textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: 400,
                minLines: 1,
                decoration: const InputDecoration(
                  contentPadding: inputPadding,
                  hintText: "Share your thoughts...",
                ),
              ),
            ),
            Obx(() {
              return Column(
                children: List.generate(
                  controller.attachments.length,
                  (index) {
                    return ListTile(
                      onTap: () {
                        // open file using open_file package
                        OpenFilex.open(controller.attachments[index].path);
                      },
                      leading: CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          radius: 20,
                          child: generateIconFromExtension(controller.attachments[index].path.split('.').last)),
                      title: Text(
                        controller.attachments[index].path.split('/').last,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        iconSize: 20,
                        onPressed: () {
                          controller.attachments.removeAt(index);
                        },
                        icon: const Icon(IconlyLight.delete),
                      ),
                    );
                  },
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Wrap(
                spacing: -5,
                children: [
                  IconButton(
                    onPressed: controller.chooseImage,
                    icon: const Icon(IconlyLight.image),
                    iconSize: 20,
                    splashRadius: 16,
                  ),
                  IconButton(
                    onPressed: controller.chooseVideo,
                    icon: const Icon(IconlyLight.video),
                    iconSize: 20,
                  ),
                  IconButton(
                    onPressed: controller.chooseDocument,
                    icon: const Icon(IconlyLight.document),
                    iconSize: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
