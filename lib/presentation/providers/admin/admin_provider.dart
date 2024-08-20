import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_time/domain/use_cases/file_use_case.dart';
import 'package:parking_time/utils/wrapper.dart';

import '../../../domain/entities/parking_lot/create_parking_lot_entity.dart';

final adminProvider = StateNotifierProvider<AdminStateNotifier, AdminState>((ref) => AdminStateNotifier(fileUseCase: ref.read(fileUseCase)));

class AdminStateNotifier extends StateNotifier<AdminState> {
  final FileUseCase _fileUseCase;

  AdminStateNotifier({required FileUseCase fileUseCase})
      : _fileUseCase = fileUseCase,
        super(AdminState(parkingLot: CreateParkingLotEntity.init(), currentImageIndex: 0));

  void addParkingLotImage() async {
    final image = await _fileUseCase.getImagePathFromGallery();
    if (image == null) return;

    state = state.copyWith(
      parkingLot: state.parkingLot.copyWith(
        images: Wrapper.value([...state.parkingLot.images, (imageUrl: image, isMainImage: state.parkingLot.images.isEmpty)])
      )
    );
  }

  void deleteParkingLotImage(String imageUrl) {
    final images = state.parkingLot.images;
    images.removeWhere((element) => element.imageUrl == imageUrl);
    if (!images.map((element) => element.isMainImage).contains(true) && images.isNotEmpty) {
      images[0] = (imageUrl: images[0].imageUrl, isMainImage: true);
    }

    state = state.copyWith(
      parkingLot: state.parkingLot.copyWith(
        images: Wrapper.value(images)
      )
    );
  }

  void setMainImage(int index) {
    final images = state.parkingLot.images
        .map((element) => (imageUrl: element.imageUrl, isMainImage: state.parkingLot.images[index].imageUrl == element.imageUrl))
        .toList();

    state = state.copyWith(
      parkingLot: state.parkingLot.copyWith(
        images: Wrapper.value(images)
      )
    );
  }

  void setImageIndex(int currentIndex) {
    state = state.copyWith(currentImageIndex: currentIndex);
  }

  void setParkingLotName(String text) {
    state = state.copyWith(parkingLot: state.parkingLot.copyWith(name: Wrapper.value(text)));
  }
}

class AdminState {
  final CreateParkingLotEntity parkingLot;

  final int currentImageIndex;

  AdminState({
    required this.parkingLot,
    required this.currentImageIndex,
  });

  AdminState copyWith({
    CreateParkingLotEntity? parkingLot,
    int? currentImageIndex,
  }) {
    return AdminState(
      parkingLot: parkingLot ?? this.parkingLot,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
    );
  }
}