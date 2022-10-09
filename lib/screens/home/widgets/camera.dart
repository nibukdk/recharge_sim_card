import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraCustomWidget extends StatefulWidget {
  CameraDescription cameraDescription;

  CameraCustomWidget(this.cameraDescription, {super.key});

  @override
  State<CameraCustomWidget> createState() => _CameraCustomWidgetState();
}

class _CameraCustomWidgetState extends State<CameraCustomWidget> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _cameraController =
        CameraController(widget.cameraDescription, ResolutionPreset.medium);
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: deviceHeight * .4,
      width: deviceWidth * .8,
      child: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
