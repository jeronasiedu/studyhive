import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/extensions/buttons.dart';

import '../manager/create_controller.dart';

class CreateCommunityPage extends GetView<CreateCommunityController> {
  const CreateCommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                "Create Your Community",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              "Your community is where you and your mates hang out. Make yours and start talking",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 25),
              child: SizedBox(
                height: 120,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.3),
                      child: const Icon(IconlyBroken.image_2),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelText: "Community Name",
                  hintText: "Study Buddies",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodySmall,
                  text: "By creating a community, you agree to Study Hive's ",
                  children: [
                    TextSpan(
                      text: "community guidelines",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                    onPressed: () {
                      controller.setLoading = false;
                    },
                    child: const Text('Create Community'))
                .withLoading(loading: controller.loading),
          ],
        ),
      ),
    );
  }
}
