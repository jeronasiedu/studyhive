import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NoAvatar extends StatelessWidget {
  const NoAvatar({Key? key, required this.initials}) : super(key: key);
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 23,
          child: Text(initials),
        ),
        Positioned(
          bottom: -5,
          right: -2,
          child: CircleAvatar(
            radius: 11,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: CircleAvatar(
              radius: 9,
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              child: const Icon(
                Ionicons.camera_outline,
                size: 13,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
