import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:provider/provider.dart';
import 'package:recharge_phone/globals/provider/user_permission_handler.dart';
import 'package:recharge_phone/globals/settings/routers/router_utils.dart';
import 'package:recharge_phone/screens/home/widgets/camera.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CameraDescription>? cameras;
  var cameraDesc;
// https://docs.flutter.dev/cookbook/plugins/picture-using-camera
  @override
  void initState() {
    super.initState();

    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      cameraDesc = cameras!.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(APP_PAGE.home.routePageTitle),
          ),
          body: Center(
            child: FutureBuilder(
                future: Provider.of<UserPermissionHandlerProvider>(context,
                        listen: false)
                    .getCameraStatus(),
                builder: (_, snapshot) {
                  // if snapshot connectinState is none or waiting
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    return const Center(
                      child: Text("Loading..."),
                    );
                  }
                  return CameraCustomWidget(cameraDesc);
                }),
          ),
        ),
      ),
    );
  }
}
