import 'package:flutter/material.dart';
import 'package:parking_time/domain/entities/parking_lot/create_parking_lot_entity.dart';
import 'package:parking_time/domain/entities/parking_lot/parking_lot_entity.dart';
import 'package:parking_time/presentation/widgets/flux_image.dart';
import '../../domain/entities/parking_lot/edit_parking_lot_entity.dart';
import '../../utils/package_utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final mockEntity = ParkingLotEntity(
    id: 1,
    name: 'vvzzaa',
    address: 'fdasfsdf-fasdfasdf-24314',
    parkingTime: DateTime.now(),
    images: [],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: AppColors.gray3, width: 1))
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  children: [
                    FluxImage(imageUrl: 'assets/images/logo/blue_simbol.svg', height: 24, color: AppColors.white),
                    SizedBox(width: 4),
                    FluxImage(imageUrl: 'assets/images/logo/blue_logo_en.svg', height: 13, color: AppColors.white),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(bottom: 3, left: 10, right: 10),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () => AppRouter.push(
                  context,
                  CreateParkingLotRoute(entity: CreateParkingLotEntity.init()),
                ),
                child: const Text('create'),
              ),
              TextButton(
                onPressed: () => AppRouter.push(
                  context,
                  UpdateParkingLotRoute(entity: UpdateParkingLotEntity.fromParkingLotEntity(mockEntity)),
                ),
                child: const Text('update'),
              ),
            ],
          )
        ),
      ),
    );
  }
}