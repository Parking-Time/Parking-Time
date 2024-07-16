import 'package:flutter/cupertino.dart';
import 'package:parking_time/config/theme/theme.dart';
import 'package:parking_time/domain/entities/parking_lot/parking_lot_entity.dart';
import 'package:parking_time/presentation/components/flux_image.dart';

class ParkingLotCard extends StatelessWidget {

  final ParkingLotEntity entity;

  const ParkingLotCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        boxShadow: [
          BoxShadow(color: kBlack.withOpacity(15), blurRadius: 4),
        ],
      ),
      child: Column(
        children: [
          FluxImage(imageUrl: entity.images.first),
          SizedBox()
        ],
      ),
    );
  }
  
}