import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/ui/custom_bottomsheet.dart';
import 'package:studyhive/src/hive/domain/entities/message.dart';
import 'package:studyhive/src/hive/presentation/manager/questions_controller.dart';

import '../../../../shared/theme/theme.dart';

class NewQuestion extends GetView<QuestionsController> {
  const NewQuestion({Key? key}) : super(key: key);

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
            child: ElevatedButton(onPressed: () {}, child: const Text("Ask")),
          ),
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
              maxLength: 400,
              minLines: 1,
              decoration: const InputDecoration(
                contentPadding: inputPadding,
                hintText: "Ask your question...",
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showCustomBottomSheet(
                  height: Get.height * 0.3,
                  child: Column(
                    children: List.generate(
                      QuestionType.values.length,
                      (index) => ListTile(
                        trailing: Obx(() {
                          return controller.questionType.value == QuestionType.values[index]
                              ? Icon(
                                  IconlyLight.paper,
                                  color: Get.theme.colorScheme.primary,
                                )
                              : const SizedBox.shrink();
                        }),
                        onTap: () {
                          controller.questionType.value = QuestionType.values[index];
                          Navigator.pop(context);
                        },
                        title: Text(
                          QuestionType.values[index].text,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ));
            },
            title: Obx(() {
              return Text(
                controller.questionType.value.text,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              );
            }),
            subtitle: Text(
              "Question Type",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: const Icon(
              IconlyLight.arrow_down_2,
              size: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              onTap: () {},
              title: Text("Not Set",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              subtitle: Text(
                "Topic",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: const Icon(
                IconlyLight.arrow_down_2,
                size: 17,
              ),
            ),
          ),
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
    );
  }
}
