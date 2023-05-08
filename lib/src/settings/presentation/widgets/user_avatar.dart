import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../shared/ui/custom_avatar.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.url, this.size = UserAvatarSize.sm}) : super(key: key);
  final String url;
  final UserAvatarSize size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomAvatar(
          radius: size == UserAvatarSize.sm ? 23 : 60,
          imageUrl: url,
        ),
        Positioned(
          bottom: size == UserAvatarSize.sm ? -5 : 1,
          right: size == UserAvatarSize.sm ? -2 : 1,
          child: CircleAvatar(
            radius: size == UserAvatarSize.sm ? 11 : 15,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: CircleAvatar(
              radius: size == UserAvatarSize.sm ? 9 : 13,
              backgroundColor: Get.isDarkMode ? theme.colorScheme.secondary : theme.colorScheme.tertiary,
              child: Icon(
                IconlyLight.camera,
                color: theme.colorScheme.background,
                size: size == UserAvatarSize.sm ? 13 : 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}

enum UserAvatarSize {
  sm,
  lg,
}
