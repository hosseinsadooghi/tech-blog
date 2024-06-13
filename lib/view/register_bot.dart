import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
          height: size.height / 5,
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
            //getting email for log in
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom
                      ),
                      child: Container(
                        height: size.height / 3,
                        decoration: BoxDecoration(
                            color: MyColors.registerTextColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //text
                              Text(
                                MyStrings.insertEmail,
                                style: textTheme.bodyMedium,
                              ),
                              //getting email field
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                                child: SizedBox(
                                  width: size.width/1.5,
                                  child: TextField(                             
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: MyStrings.emailExample,
                                        hintStyle: textTheme.labelMedium
                                    ),
                                  ),
                                ),
                              ),
                              //going to verification buttom
                              ElevatedButton(
                                onPressed: (){
                      
                              }, 
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    MyStrings.continueText,
                                    style: textTheme.displayLarge,                                  
                                  ),
                                ))
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                MyStrings.letsStart,
                style: textTheme.displayLarge,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
