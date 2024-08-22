import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/article_list_screen.dart';
import 'package:tech_blog/view/splash_screen.dart';
import 'package:tech_blog/view/user_name_and_categories.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: MyColors.statusBarColor,
      systemNavigationBarColor: MyColors.navigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

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
            //project inputs decoration
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: MyColors.primaryColor),
              ),
            ),
            //project buttoms decoration
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  backgroundColor: WidgetStateColor.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.pressed)) {
                        return MyColors.primaryActiveColor;
                      }
                      return MyColors.primaryColor;
                    },
                  )),
            ),
            fontFamily: 'dana',
            textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: MyColors.posterTitle),
                titleMedium: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: MyColors.posterSubTitle),
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
                displaySmall: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 12,
                    color: MyColors.textTitle,
                    fontWeight: FontWeight.w300),
                titleSmall: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 13,
                    color: MyColors.articleTitle,
                    fontWeight: FontWeight.w300),
                bodyLarge: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.w700),
                labelSmall: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: MyColors.hintText,
                    fontWeight: FontWeight.w700),
                bodyMedium: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.w300),
                labelMedium: TextStyle(
                    fontFamily: 'dana',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700))),
        debugShowCheckedModeBanner: false,
        home: ArticleListScreen());
  }
}
