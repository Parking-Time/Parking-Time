import 'dart:math';

import 'package:flutter/material.dart';
import 'package:parking_time/domain/entities/parking_lot/light_parking_lot_entity.dart';
import 'package:parking_time/presentation/components/chip/color_chip.dart';
import 'package:parking_time/utils/extensions/duration_extensions.dart';
import 'package:parking_time/utils/extensions/int_extensions.dart';

import '../../../presentation/resources/app_colors.dart';
import '../../../presentation/resources/assets.gen.dart';
import '../common/flux_image.dart';

class ParkingLotCard extends StatelessWidget {

  final LightParkingLotEntity entity;

  const ParkingLotCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 205,
      height: 277,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        boxShadow: [
          BoxShadow(color: kBlack.withOpacity(0.15), blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                    colors: [
                      kBlack.withOpacity(0.4),
                      kBlack.withOpacity(0.1),
                      kBlack.withOpacity(0.0),
                      kBlack.withOpacity(0.1),
                      kBlack.withOpacity(0.4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  )
                ),
                child: FluxImage(imageUrl: entity.image, height: 120, fit: BoxFit.cover),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(entity.name, style: textTheme.titleMedium),
          const SizedBox(height: 4),
          _buildColorChipListView(),
          const SizedBox(height: 14),
          Row(
            children: [
              Assets.icons.bxsDollarCircle.svg(height: 20, width: 20, colorFilter: const ColorFilter.mode(kYellow3, BlendMode.srcIn)),
              const SizedBox(width: 2),
              Builder(builder: (context) {
                final currentDay = entity.amountOfCurrentDay;

                if (currentDay == null) return Text('정보가 없습니다.', style: textTheme.bodySmall?.copyWith(color: kYellow3));

                final stackDuration = Duration(seconds: currentDay.stackTime);
                final stackTime = stackDuration.inMinutes >= 60 ? '${stackDuration.inHours}시간' : '${stackDuration.inMinutes}분';
                return Text(
                  '$stackTime ${currentDay.stackAmount.toNumberFormat()}원',
                  style: textTheme.bodySmall?.copyWith(color: kYellow3),
                );
              }),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Assets.icons.bxsTimeFive.svg(height: 20, width: 20, colorFilter: const ColorFilter.mode(kBlue3, BlendMode.srcIn)),
              const SizedBox(width: 2),
              Builder(builder: (context) {
                if (entity.closeTime == null || entity.openTime == null) {
                  return Text('정보가 없습니다.', style: textTheme.bodySmall?.copyWith(color: kBlue3));
                }

                if (entity.openTime!.inSeconds == 0 && entity.closeTime!.inSeconds == 86400) {
                  return Text('24시간 운영', style: textTheme.bodySmall?.copyWith(color: kBlue3));
                }

                return Text(
                  '${entity.openTime!.toHHmm()} ~ ${entity.closeTime!.toHHmm()}',
                  style: textTheme.bodyMedium?.copyWith(color: kBlue3),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorChipListView() => Stack(
    children: [
      SizedBox(
        width: 205,
        height: 21,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: min(3, entity.types.length),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ColorChip(
              title: entity.types[index].title,
              titleColor: entity.types[index].titleColor,
              backgroundColor: entity.types[index].backgroundColor,
            ),
          ),
        ),
      ),
      Positioned(
        width: 60,
        height: 21,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kWhite, kWhite.withOpacity(0)],
              end: AlignmentDirectional.centerStart,
              begin: AlignmentDirectional.centerEnd,
            ),
          ),
        ),
      ),
    ],
  );
  
}