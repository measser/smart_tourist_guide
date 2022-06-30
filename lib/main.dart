import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/register/register_cubit/cubit.dart';
import 'package:smarttouristguide/modules/splash_screen/splash_screen.dart';
import 'package:smarttouristguide/modules/welcome_screen/welcome_screen.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/shared/block_observer.dart';
import 'package:smarttouristguide/shared/components/constants.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';
import 'package:smarttouristguide/shared/styles/themes.dart';
//dsdsdsdsds
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  // dynamic onBoarding = CacheHelper.getData(key: 'OnBoarding');

  token = CacheHelper.getData(key: 'token') ?? '';

    if (token != '') {
      widget = SplashScreen(widget: AppLayout());
    } else {
      widget = SplashScreen(widget: Welcome());
    }

  BlocOverrides.runZoned(
    () {
      runApp(
        MyApp(
          startWidget: widget,
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppRegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getHomeData()
            ..getCategoriesPlacesData()
            ..getFavorites()
            ..getProfile()
            ..getInterests(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Tourist guide',
        theme: lightTheme,
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(400, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
        home: startWidget,
      ),
    );
  }
}
