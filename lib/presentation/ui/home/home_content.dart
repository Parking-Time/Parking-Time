import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_time/presentation/components/card/parking_lot_card.dart';

import '../../../presentation/resources/app_colors.dart';
import '../../providers/home/home_provider.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nearbyParkingLotList = ref.watch(homeProvider).nearbyParkingLotList;

    return Container(
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.none,
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
          nearbyParkingLotList.when(
            data: (data) => SizedBox(
              height: 277,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ParkingLotCard(entity: data[index]);
                },
              ),
            ),
            error: (error, stackTrace) => Text('$error\n$stackTrace'),
            loading: () => const SizedBox(),
          ),
        ],
      ),
    );
  }

}