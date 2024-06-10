import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/splash_screen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: MyColors.statusBarColor,
    systemNavigationBarColor: MyColors.navigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), // farsi
        ],
        theme: ThemeData(
            fontFamily: 'dana',
            textTheme:const TextTheme(
              displayLarge: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: MyColors.posterTitle
              ),
              titleMedium: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: MyColors.posterSubTitle
              ),
              displayMedium: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
              bodySmall: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              headlineMedium: TextStyle(
                  fontFamily: 'dana',
                  fontSize: 14,
                  color: MyColors.seeMore,
                  fontWeight: FontWeight.w700),
              displaySmall:TextStyle(
                  fontFamily: 'dana',
                  fontSize: 12,
                  color: MyColors.textTitle,
                  fontWeight: FontWeight.w300),
              titleSmall: TextStyle(
                fontFamily: 'dana',
                fontSize: 13,
                color: MyColors.articleTitle,
                fontWeight: FontWeight.w300
              ),
              bodyMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w700
              )
              
              
            )),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
