import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';

class RegisterBot extends StatelessWidget {
  const RegisterBot({
    super.key,
    required this.size,
    required this.textTheme,
    required this.marginFromSide,
  });

  final Size size;
  final TextTheme textTheme;
  final double marginFromSide;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        //spce from top
        SizedBox(
          height: size.height/5,
        ),
        //bot image
        SvgPicture.asset(
          Assets.images.regBot.path,
          height: size.height / 6.8,
        ),
        //welcome text
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: MyStrings.regBotText,
                style: textTheme.bodyMedium,
              )),
        ),
        //buttom
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "بزن بریم",
                style: textTheme.displayLarge,
              ),
            ),
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
        ),
      ],
    ));
  }
}
