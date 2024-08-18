import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controlers/home_screen_controler.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake-data.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_strings.dart';

class UserNameAndCategories extends StatefulWidget {
  @override
  State<UserNameAndCategories> createState() => _UserNameAndCategoriesState();
}

class _UserNameAndCategoriesState extends State<UserNameAndCategories> {
  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    int selectedCategoryIndex = 0;
    //for the color of the status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: MyColors.statusBarColor,
        systemNavigationBarColor: MyColors.navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            //space from above
            SizedBox(
              height: size.height / 20,
            ),
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
              padding:
                  EdgeInsets.only(left: marginFromSide, right: marginFromSide),
              child: SizedBox(
                height: size.height / 8,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeScreenController.tagList.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.height / 67.72,
                      mainAxisSpacing: size.width / 18.35,
                      childAspectRatio: 0.28),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                            if (!chosenCategories.contains(homeScreenController
                                .tagList[selectedCategoryIndex])) {
                              chosenCategories.add(homeScreenController
                                  .tagList[selectedCategoryIndex]);
                            }
                          });
                        },
                        child: MainTags(textTheme: textTheme, index: index));
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
              width: size.width / 8.72,
            ),
            //space between downpointer and selecterd categories
            SizedBox(
              height: size.height / 33.86,
            ),
            //selected categories
            Padding(
              padding:
                  EdgeInsets.only(left: marginFromSide, right: marginFromSide),
              child: SizedBox(
                height: size.height / 16,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: chosenCategories.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: size.height / 67.72,
                      mainAxisSpacing: size.width / 18.35,
                      childAspectRatio: 0.31),
                  itemBuilder: (context, index) {
                    var textTheme = Theme.of(context).textTheme;
                    return Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: MyColors.surface),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chosenCategories[index].title!,
                              style: textTheme.bodySmall,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCategoryIndex = index;
                                  chosenCategories.removeAt(index);
                                });
                              },
                              child: Icon(
                                CupertinoIcons.delete,
                                size: 20,
                                color: MyColors.deleteIconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            //space between selected categories and continue button
            SizedBox(
              height: size.height / 33.86,
            ),
            //continue button
            ElevatedButton(
                onPressed: () {},
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
    )));
  }
}
