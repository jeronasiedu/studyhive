import 'package:flutter/material.dart';

class InviteMemberPage extends StatelessWidget {
  const InviteMemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: const Center(child: Text('Invite Member')),
    );
  }
}
