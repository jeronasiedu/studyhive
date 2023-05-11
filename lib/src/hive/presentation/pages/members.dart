import 'package:flutter/material.dart';
import 'package:studyhive/generated/assets.dart';

import '../../../../shared/ui/empty_state.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmptyState(
      text: 'Invite your friends to join your hive',
      asset: Assets.members,
    );
  }
}
