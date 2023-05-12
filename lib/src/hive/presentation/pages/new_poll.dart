import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/src/hive/presentation/manager/poll_controller.dart';

import '../../../../shared/theme/theme.dart';

class NewPoll extends GetView<PollController> {
  const NewPoll({Key? key}) : super(key: key);

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
              })),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 200,
              minLines: 1,
              decoration: const InputDecoration(
                contentPadding: inputPadding,
                hintText: "Ask your community...",
              ),
            ),
          ),
          // render the pollOptions down here
          Obx(() {
            return Column(
              children: controller.optionControllers
                  .asMap()
                  .entries
                  .map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: TextFormField(
                        controller: entry.value,
                        decoration: InputDecoration(
                          contentPadding: inputPadding,
                          hintText: "Option ${entry.key + 1}",
                          suffixIcon: entry.key >= 2
                              ? IconButton(
                                  onPressed: () {
                                    controller.optionControllers.removeAt(entry.key);
                                    entry.value.dispose();
                                  },
                                  icon: const Icon(Icons.close),
                                  iconSize: 16,
                                  splashRadius: 12,
                                )
                              : null,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }),

          Obx(() {
            return Visibility(
              visible: controller.optionControllers.length < 6,
              child: TextButton(
                onPressed: controller.addOption,
                child: const Text("Add option"),
              ),
            );
          })
        ],
      ),
    );
  }
}
