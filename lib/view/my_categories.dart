import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake-data.dart';
import 'package:tech_blog/my_component.dart';
import 'package:tech_blog/my_strings.dart';

class MyCategories extends StatelessWidget {
  MyCategories({
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;
  
  

  @override
  Widget build(BuildContext context) {
    var marginFromSide = size.width / 12.46;
    return SafeArea(    
        child: Scaffold(
            body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //register bot picture
            SvgPicture.asset(
              Assets.images.regBot.path,
              height: size.height / 6.8,
            ),
            //space between picture and complete your info text
            SizedBox(
              height: size.height / 47.9,
            ),
            //complete your info text
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.chooseYourCategories,
                    style: textTheme.bodyMedium,
                  )),
            ),
            //space between complete your info text and input name
            SizedBox(
              height: size.height / 25.5,
            ),
            //input your name and family
            SizedBox(
              width: size.width / 1.54,
              height: size.height / 18.88,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: MyStrings.inputYourNameAndLastName,
                  hintText: MyStrings.inputYourNameAndLastName,
                  hintStyle: textTheme.labelMedium,
                ),
              ),
            ),
            //space between input name and select your categories text
            SizedBox(
              height: size.height / 17.69,
            ),
            //select your categories text
            Text(
              MyStrings.selectYourCategories,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
            //space between select your categories text and categories
            SizedBox(
              height: size.height / 33.86,
            ),
            //categories
            Padding(
              padding: EdgeInsets.only(
                left: marginFromSide,
                right: marginFromSide
              ),
              child: SizedBox(
                height: size.height / 8,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: tagList.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.height/67.72,
                      mainAxisSpacing: size.width/18.35,
                      childAspectRatio: 0.3),
                  itemBuilder: (context, index) {
                    return MainTags(textTheme: textTheme, index: index);
                  },
                ),
              ),
            ),
            //space between categories and downpointer
            SizedBox(
              height: size.height / 33.86,
            ),
            //downpoitner
            Image.asset(
              Assets.icons.downPinter.path,
              width: size.width/8.72,
            ),
            //space between downpointer and selecterd categories
            SizedBox(
              height: size.height / 33.86,
            ),
            //selected categories
            Padding(
              padding: EdgeInsets.only(
                left: marginFromSide,
                right: marginFromSide
              ),
              child: SizedBox(
                height: size.height / 8,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: tagList.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.height/67.72,
                      mainAxisSpacing: size.width/18.35,
                      childAspectRatio: 0.3),
                  itemBuilder: (context, index) {
                    return MainTags(textTheme: textTheme, index: index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
