import 'package:flutter/material.dart';
import 'package:studyhive/shared/ui/custom_avatar.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.url,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final String? url;

  @override
  Widget build(BuildContext context) {
    // assert if url is not null then
    return ListTile(
      onTap: onTap,
      leading: url == null
          ? CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
              child: leading,
            )
          : CustomAvatar(
              imageUrl: url!,
            ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing,
    );
  }
}
