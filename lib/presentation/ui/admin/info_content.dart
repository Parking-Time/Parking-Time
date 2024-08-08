import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        TextField(
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(
            hintText: '주차장 이름',
            border: OutlineInputBorder(borderRadius: kAllRound9),
            enabledBorder: OutlineInputBorder(borderRadius: kAllRound9),
          ),
          onChanged: notifier.setParkingLotName,
        ),
        const SizedBox(height: 20),
        TextField(
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(
            hintText: '주차장 이름',
            border: OutlineInputBorder(borderRadius: kAllRound9),
            enabledBorder: OutlineInputBorder(borderRadius: kAllRound9),
          ),
          onChanged: notifier.setParkingLotName,
        ),
      ],
    );
  }

}