
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/text_style.dart';
import 'package:tech_blog/controlers/home_screen_controler.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake-data.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';


  PreferredSize techBlogAppBar(context,String title) {
    var size = MediaQuery.of(context).size;
    var marginFromSide = size.width / 12.46;
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(left: marginFromSide),
              child: Center(
                child: Text(
                  title,
                  style: appBarTextStyle,),
              ),
            ),
            
          ],
          leading: Padding(
            padding: EdgeInsets.only(right: marginFromSide),
            child: Container(
              height: size.width / 8,
              width: size.width / 8,
              decoration: BoxDecoration(
                color: MyColors.primaryColor.withAlpha(100),
                shape: BoxShape.circle),
              child: Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        ),
      ),
    );
  }


class techDivider extends StatelessWidget {
  const techDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: MyColors.divider,
      indent: size.width / 6.41,
      endIndent: size.width / 6.41,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: MyColors.hashTagsIcons,
              size: 14,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              Get.find<HomeScreenController>().tagList[index].title!,
              style: textTheme.displayMedium,
            )
          ],
        ),
      ),
    );
  }
}

mylaunchUrl(String url) async {
  var uri = Uri.parse(url);
  await launchUrl(uri);
}

class loading extends StatelessWidget {
  const loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      color: MyColors.primaryColor,
      size: 32,
    );
  }
}