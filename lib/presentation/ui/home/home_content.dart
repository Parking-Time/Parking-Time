import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_time/config/theme/theme.dart';
import 'package:parking_time/presentation/components/flux_image.dart';
import 'package:parking_time/presentation/providers/home/home_provider.dart' as provider;


class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProvider = ref.watch(provider.homeProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 126,
            decoration: const BoxDecoration(
              color: kGray3,
              borderRadius: BorderRadius.all(Radius.circular(7))
            ),
          ),
          const SizedBox(height: 35),
          Text('방문자님, 근처\n주차장을 찾아봤어요!', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),

        ],
      ),
    );
  }

}