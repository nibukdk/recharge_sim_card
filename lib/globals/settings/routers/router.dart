import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:recharge_phone/globals/settings/routers/router_utils.dart';
import 'package:recharge_phone/screens/home/home.dart';
import 'package:recharge_phone/screens/home/widgets/camera.dart';

class AppRouter {
  get router => _router;

  final _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: APP_PAGE.home.routePath,
        name: APP_PAGE.home.routeName,
        builder: (context, state) => const Home(),
        // builder: (context, state) => const CameraCustomWidget(),
      ),
    ],
  );
}
