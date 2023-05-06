import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../shared/ui/custom_avatar.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomAvatar(
          radius: 23,
          imageUrl: url,
        ),
        Positioned(
          bottom: -5,
          right: -2,
          child: CircleAvatar(
            radius: 11,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: Get.isDarkMode ? theme.colorScheme.secondary : theme.colorScheme.tertiary,
              child: Icon(
                Ionicons.camera_outline,
                color: theme.colorScheme.background,
                size: 13,
              ),
            ),
          ),
        )
      ],
    );
    ;
  }
}
