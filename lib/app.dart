import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recharge_phone/globals/provider/user_permission_handler.dart';
import 'package:recharge_phone/globals/settings/routers/router.dart';

class MyApp extends StatefulWidget {
  CameraDescription? cameraDescription;
  MyApp({this.cameraDescription, super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => AppRouter()),
          ChangeNotifierProvider(
              create: (ctx) => UserPermissionHandlerProvider()),
        ],
        child: Builder(
          builder: ((context) {
            final GoRouter router =
                Provider.of<AppRouter>(context, listen: false).router;
            return MaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
            );
          }),
        ));
  }
}
