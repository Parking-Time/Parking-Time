import 'package:permission_handler/permission_handler.dart';

class PermissionUseCase {

  Future<PermissionStatus> requestPermission(PermissionWithService permission) async {
    if (await permission.isGranted) return await permission.status;

    final result = await permission.request();
    if (result.isDenied) {
      return await requestPermission(permission);
    } else {
      return result;
    }
  }

}