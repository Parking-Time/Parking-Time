import 'package:flutter/material.dart';
import 'package:parking_time/presentation/resources/app_colors.dart';

import '../../../presentation/router/app_router.dart';
import '../../resources/assets.gen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: AppRouter.pop,
          icon: Assets.icons.bxsBack.svg(colorFilter: const ColorFilter.mode(kBlack, BlendMode.srcIn)),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
