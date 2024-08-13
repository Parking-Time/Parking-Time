import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_time/presentation/components/text_field/filled_text_field.dart';
import 'package:parking_time/presentation/providers/admin/admin_provider.dart';

import '../../resources/styles/shape.dart';

class InfoContent extends ConsumerWidget {
  const InfoContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(adminProvider);
    final notifier = ref.watch(adminProvider.notifier);

    return Column(
      children: [
        FilledTextField(
          hintText: '주차장 이름',
          onChanged: notifier.setParkingLotName,
        ),
        const SizedBox(height: 20),
        FilledTextField(
          hintText: '주소',
          onChanged: notifier.setParkingLotName,
        ),
      ],
    );
  }

}