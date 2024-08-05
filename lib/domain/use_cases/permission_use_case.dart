import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionUseCase = Provider((ref) => PermissionUseCase());

class PermissionUseCase {

  Future<PermissionStatus> requestPermission(PermissionWithService permission, {bool useRetry = true}) async {
    final status = await permission.status;
    if (status.isGranted) return status;

    final result = await permission.request();
    if (result.isDenied) {
      return await requestPermission(permission, useRetry: false);
    } else {
      return result;
    }
  }

}