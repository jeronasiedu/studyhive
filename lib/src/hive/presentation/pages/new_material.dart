import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../shared/theme/theme.dart';

class NewMaterial extends StatelessWidget {
  const NewMaterial({Key? key}) : super(key: key);

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
            child: ElevatedButton(onPressed: () {}, child: const Text("Share")),
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
              maxLength: 100,
              minLines: 1,
              decoration: const InputDecoration(
                contentPadding: inputPadding,
                hintText: "Describe your material...",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
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
                  onPressed: () {},
                  icon: const Icon(IconlyLight.image),
                  iconSize: 20,
                  splashRadius: 16,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyLight.video),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {},
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
