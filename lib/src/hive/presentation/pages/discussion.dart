import 'package:flutter/material.dart';
import 'package:studyhive/generated/assets.dart';
import 'package:studyhive/shared/ui/empty_page.dart';

class DiscussionsPage extends StatelessWidget {
  const DiscussionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: EmptyState(
        text: 'Start a discussion with your colleagues!',
        asset: Assets.discussion,
      ),
    );
  }
}
