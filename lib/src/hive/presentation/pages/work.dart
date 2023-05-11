import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../../shared/ui/empty_state.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyState(
      text: 'Post a question or share a resource!',
      asset: Assets.hiveWork,
    );
  }
}
