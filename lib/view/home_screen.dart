import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controlers/home_screen_controler.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake-data.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Column(
          children: [
            poster(context),
            //space between poster and tags
            const SizedBox(
              height: 16,
            ),

            HomePageTags(marginFromSide: marginFromSide, textTheme: textTheme),
            //space between hashtags and hot articles
            const SizedBox(
              height: 32,
            ),

            SeeMoreArticles(
                marginFromSide: marginFromSide, textTheme: textTheme),

            topVisited(context),
            //space between articles and poscasts
            const SizedBox(
              height: 32,
            ),

            SeeMorePodCasts(
                marginFromSide: marginFromSide, textTheme: textTheme),

            topPodcasts(context),
            //space between podcast and bottom of the window so it doesnt go behind the navbar
            SizedBox(
              height: size.height / 10,
            )
          ],
        ),
      ),
    );
  }

  Widget topVisited(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;
    return SizedBox(
      height: size.height / 3.9,
      child: ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //each blog item
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  index == homeScreenController.topVisitedList.length - 1
                      ? marginFromSide
                      : 8,
                  8,
                  index == 0 ? marginFromSide : 15,
                  8),
              child: Column(
                children: [
                  //image and publisher
                  SizedBox(
                    height: size.height / 5.53,
                    width: size.width / 2.66,
                    child: Stack(
                      children: [
                        //image
                        CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                              foregroundDecoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                      colors: GradientColors.blogList,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            );
                          },
                          placeholder: (context, url) {
                            return SpinKitFadingCube(
                              color: MyColors.primaryColor,
                              size: 32,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                            );
                          },
                        ),

                        //text on the image
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //writer
                              Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.titleSmall),
                              //view
                              Text(
                                  "view ${homeScreenController.topVisitedList[index].view!}",
                                  style: textTheme.titleSmall)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //space between banner and text
                  const SizedBox(
                    height: 8,
                  ),
                  //text
                  SizedBox(
                    width: size.width / 2.66,
                    child: Text(
                      homeScreenController.topVisitedList[index].title!,
                      style: textTheme.displaySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }

  Widget topPodcasts(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;
    return SizedBox(
      height: size.height / 4.5,
      child: ListView.builder(
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //each podcast item
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  index == homeScreenController.topPodcastList.length - 1
                      ? marginFromSide
                      : 8,
                  8,
                  index == 0 ? marginFromSide : 15,
                  8),
              child: Column(
                children: [
                  //image
                  SizedBox(
                    height: size.height / 7,
                    width: size.width / 3.1,
                    child: CachedNetworkImage(
                      imageUrl:
                          homeScreenController.topPodcastList[index].poster!,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)));
                      },
                      placeholder: (context, url) {
                        return SpinKitFadingCube(
                          color: MyColors.primaryColor,
                          size: 32,
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                        );
                      },
                    ),
                  ),
                  //space between banner and text
                  const SizedBox(
                    height: 8,
                  ),
                  //text
                  SizedBox(
                    width: size.width / 3.1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            homeScreenController.topPodcastList[index].title!,
                            style: textTheme.displaySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                  ),
                ],
              ),
            );
          })),
    );
  }

  Widget poster(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;
    return Stack(
      children: [
        //image and cover
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)));
            },
            placeholder: (context, url) {
              return SpinKitFadingCube(
                color: MyColors.primaryColor,
                size: 32,
              );
            },
            errorWidget: (context, url, error) {
              return Icon(
                Icons.image_not_supported_outlined,
                size: 50,
              );
            },
          ),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCoverGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        //poster texts
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              //title
              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.displayLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}

class SeeMorePodCasts extends StatelessWidget {
  const SeeMorePodCasts({
    super.key,
    required this.marginFromSide,
    required this.textTheme,
  });

  final double marginFromSide;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, marginFromSide, 8),
      child: Row(
        children: [
          //pen icon
          ImageIcon(
            Assets.icons.mic.provider(),
            color: MyColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          //read more articles
          Text(
            MyStrings.viewHotPodCasts,
            style: textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}

class SeeMoreArticles extends StatelessWidget {
  const SeeMoreArticles({
    super.key,
    required this.marginFromSide,
    required this.textTheme,
  });

  final double marginFromSide;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, marginFromSide, 8),
      child: Row(
        children: [
          //pen icon
          ImageIcon(
            Assets.icons.pen.provider(),
            color: MyColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          //read more articles
          Text(
            MyStrings.viewHotBlog,
            style: textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}

class HomePageTags extends StatelessWidget {
  const HomePageTags({
    super.key,
    required this.marginFromSide,
    required this.textTheme,
  });

  final double marginFromSide;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  index == tagList.length - 1 ? marginFromSide : 0,
                  8,
                  index == 0 ? marginFromSide : 15,
                  8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            );
          })),
    );
  }
}
