import 'package:finder_app/src/core/router/app_route.dart';
import 'package:finder_app/src/features/intro/bloc/intro_bloc/intro_cubit.dart';
import 'package:finder_app/src/features/intro/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => IntroCubit())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),

      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: "Finder app",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            fontFamily: 'SofiaSans',
          ),
          onGenerateRoute: AppRouter.generateRoute,
          home: const IntroScreen(),
        );
      },
    );
  }
}
