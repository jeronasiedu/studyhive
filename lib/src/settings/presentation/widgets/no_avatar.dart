import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class NoAvatar extends StatelessWidget {
  const NoAvatar({Key? key, required this.initials, this.size = NoAvatarSize.sm}) : super(key: key);
  final String initials;
  final NoAvatarSize size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: size == NoAvatarSize.sm ? 23 : 60,
          child: Text(
            initials,
            style: size == NoAvatarSize.sm
                ? theme.textTheme.bodyMedium
                : theme.textTheme.titleLarge!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
          ),
        ),
        Positioned(
          bottom: size == NoAvatarSize.sm ? -5 : 1,
          right: size == NoAvatarSize.sm ? -2 : 1,
          child: CircleAvatar(
            radius: size == NoAvatarSize.sm ? 9 : 13,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: Get.isDarkMode ? theme.colorScheme.secondary : theme.colorScheme.tertiary,
              child: Icon(
                IconlyLight.camera,
                color: theme.colorScheme.background,
                size: size == NoAvatarSize.sm ? 13 : 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}

enum NoAvatarSize {
  sm,
  lg,
}
