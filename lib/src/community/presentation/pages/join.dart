import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyhive/shared/extensions/buttons.dart';
import 'package:studyhive/src/community/presentation/manager/join_controller.dart';

import '../../../../shared/ui/snackbars.dart';

class JoinCommunityPage extends GetView<JoinCommunityController> {
  const JoinCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(14),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                "Join a community",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Enter an invite below to join an existing community",
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                labelText: "Invite Link",
                hintText: "https://studyhive.page.link/htkQ",
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  showSuccessSnackbar(message: "Join Community");
                },
                child: const Text("Join community"),
              ).withLoading(),
            )
          ],
        ),
      ),
    );
  }
}
