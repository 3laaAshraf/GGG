import 'package:dark/Screens/Register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'cache_helper.dart';
import 'darkMode_cubit/darkCubit.dart';
import 'darkMode_cubit/dark_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // تهيئة التخزين المؤقت
  await initializeCacheHelper();

  // قراءة وضع التطبيق (فاتح/مظلم) من التخزين المؤقت
  bool isDark = CacheHelper.getBolleanData(key: 'isDark') ?? false;

  // تشغيل التطبيق
  runApp(
    BlocProvider(
      create: (context) => NewsCubit()..changeAppMode(fromShared: isDark),
      child: DarkMode(isDark),
    ),
  );
}

class DarkMode extends StatelessWidget {
  final bool Dark;
  const DarkMode(this.Dark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..changeAppMode(fromShared: Dark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, NewsStates state) {},
        builder: (BuildContext context, NewsStates state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.red,
              ),
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  size: 30,
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.red,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.red,
                elevation: 20,
                titleTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                elevation: 20,
                selectedItemColor: Colors.red,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.red,
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(
                  size: 30,
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 20,
                selectedItemColor: Colors.red,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: BlocProvider.of<NewsCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: Register(),
          );
        },
      ),
    );
  }
}
