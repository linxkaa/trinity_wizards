import 'package:auto_route/auto_route.dart';
import 'package:trinity_wizards/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: MainRoute.page, initial: true),
  ];
}
