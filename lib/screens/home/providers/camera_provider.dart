import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class CameraProvider extends ChangeNotifier {
  var cameras;
  var cameraDesc;

  Future<void> getCameraInitialized() async {}
}
