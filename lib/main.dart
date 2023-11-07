import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trinity_wizards/core/commons/theme.dart';
import 'package:trinity_wizards/core/injection/injection.dart';
import 'package:trinity_wizards/core/routes/app_router.dart';
import 'package:trinity_wizards/core/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  configureInjection();
  runApp(const TrinityWizardsApp());
}

class TrinityWizardsApp extends StatelessWidget {
  const TrinityWizardsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () {
          return MaterialApp.router(
            theme: AppTheme.theme,
            darkTheme: AppTheme.theme,
            routerDelegate: AutoRouterDelegate(router),
            routeInformationParser: router.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
