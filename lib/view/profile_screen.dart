
import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_component.dart';
import 'package:tech_blog/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          //space between appbar and profile avatar
          const SizedBox(
            height: 30,
          ),
          //profile avatar
          Image(
            image: Assets.icons.avatar.provider(),
            width:size.width/3.7,
          ),
          //space between avatar and edit text
          const SizedBox(
            height: 10,
          ),
          //edit avatar text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                Assets.icons.pen.provider(),
                color: MyColors.editAvatar,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                MyStrings.imageProfileEdit,
                style: textTheme.headlineMedium,

              )
            ],
          ),
          //space between edi avatar part and user name
          const SizedBox(
            height: 60,
          ),
          //user name
          Text(
            "فاطمه امیری",
            style: textTheme. bodySmall,
          ),
          //email
          Text(
            "fatemeamiri@gmail.com",
            style: textTheme. bodySmall,
          ),
          //space between user email and user favorite articles
          const SizedBox(
            height: 30,
          ),
          //line over user favorite articled
          techDivider(size: size),
          //user favorite articles
          InkWell(
            onTap: (() {
              
            }),
            splashColor: MyColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavortieArticles,
                  style: textTheme.bodySmall,
                
                ),
              ),
            ),
          ),
          //line over user favorite podcast
          techDivider(size: size),
          //user favorite podcasts
          InkWell(
            onTap: (() {
              
            }),
            splashColor: MyColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavortiePodCasts,
                  style: textTheme.bodySmall,
                
                ),
              ),
            ),
          ),
          //line over logout
          techDivider(size: size),
          //logout
          InkWell(
            onTap: (() {
              
            }),
            splashColor: MyColors.primaryColor,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.logOut,
                  style: textTheme.bodySmall,
                
                ),
              ),
            ),
          ),


        ],
      )
    );
  }
}



