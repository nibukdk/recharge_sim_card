import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recharge_phone/app.dart';

Future<void> main() async {
  //  concrete binding for applications based on the Widgets framewor
  WidgetsFlutterBinding.ensureInitialized();
  var cameras = await availableCameras();
  var cameraDesc = cameras.first;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black38),
  );

  runApp(MyApp(cameraDescription: cameraDesc));
}
