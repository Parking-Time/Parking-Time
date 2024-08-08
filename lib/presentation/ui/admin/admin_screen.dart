import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_time/presentation/components/common/flux_image.dart';
import 'package:parking_time/presentation/providers/admin/admin_provider.dart';
import 'package:parking_time/presentation/resources/styles/colors.dart';
import 'package:parking_time/presentation/resources/styles/shape.dart';
import 'package:parking_time/presentation/ui/admin/image_content.dart';
import 'package:parking_time/presentation/ui/admin/info_content.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ImageContent(),
            SizedBox(height: 20),
            InfoContent(),
          ],
        ),
      ),
    );
  }
}
