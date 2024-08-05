import 'package:flutter/material.dart';

import '../../../presentation/router/app_router.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () => AppRouter.getRoute(),
            child: const Text('주차장 만들기'),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => AppRouter.getRoute(),
            child: const Text('주차장 수정하기'),
          ),
        ],
      ),
    );
  }
}
