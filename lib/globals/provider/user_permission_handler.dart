import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

class UserPermissionHandlerProvider with ChangeNotifier {
  PermissionStatus _cameraStatus = PermissionStatus.denied;

  get cameraStatus => _cameraStatus;

  Future<void> getCameraStatus() async {
    final status = await Permission.camera.request();

    _cameraStatus = status;

    notifyListeners();
  }
}
