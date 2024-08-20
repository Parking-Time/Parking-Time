import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final fileUseCase = Provider((ref) => FileUseCase(imagePicker: ImagePicker()));

class FileUseCase {

  final ImagePicker _imagePicker;

  FileUseCase({required ImagePicker imagePicker}) : _imagePicker = imagePicker;

  Future<String?> getImagePathFromGallery({int? imageQuality}) async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: imageQuality);
    return image?.path;
  }

}