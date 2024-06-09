
import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake-data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
          
          HomePagePoster(size: size, textTheme: textTheme),
          //space between poster and tags
          const SizedBox(
            height: 16,
          ),
          
          HomePageTags(marginFromSide: marginFromSide, textTheme: textTheme),
          //space between hashtags and hot articles
          const SizedBox(
            height: 32,
          ),

          SeeMoreArticles(marginFromSide: marginFromSide, textTheme: textTheme),
          
          HomePageArticlesList(size: size, marginFromSide: marginFromSide, textTheme: textTheme),
          //space between articles and poscasts
          const SizedBox(
            height: 32,
          ),

          SeeMorePodCasts(marginFromSide: marginFromSide, textTheme: textTheme),

          HomePagePodCastsList(size: size, marginFromSide: marginFromSide, textTheme: textTheme),
          //space between podcast and bottom of the window so it doesnt go behind the navbar
          SizedBox(
            height: size.height / 10,
          )
        ],
      ),
    );
  }
}

class HomePagePodCastsList extends StatelessWidget {
  const HomePagePodCastsList({
    super.key,
    required this.size,
    required this.marginFromSide,
    required this.textTheme,
  });

  final Size size;
  final double marginFromSide;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.5,
      child: ListView.builder(
          itemCount: podCastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //each podcast item
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  8, 8, index == 0 ? marginFromSide : 15, 8),
              child: Column(
                children: [
                  //image
                  SizedBox(
                    height: size.height / 7,
                    width: size.width / 3.1,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(16))),
                      child: podCastList[index].bannerUrl,
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
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            podCastList[index].name,
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

class HomePageArticlesList extends StatelessWidget {
  const HomePageArticlesList({
    super.key,
    required this.size,
    required this.marginFromSide,
    required this.textTheme,
  });

  final Size size;
  final double marginFromSide;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.9,
      child: ListView.builder(
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //each blog item
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  8, 8, index == 0 ? marginFromSide : 15, 8),
              child: Column(
                children: [
                  //image and publisher
                  SizedBox(
                    height: size.height / 5.53,
                    width: size.width / 2.66,
                    child: Stack(
                      children: [
                        //image
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    blogList[index].bannerUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration:
                              const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(16)),
                                  gradient: LinearGradient(
                                      colors: GradientColors.blogList,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
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
                              Text(blogList[index].writer,
                                  style: textTheme.titleSmall),
                              //view
                              Text(
                                  "view ${blogList[index].views}",
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
                      blogList[index].title,
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
                  0, 8, index == 0 ? marginFromSide : 15, 8),
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(20)),
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
                        tagList[index].title,
                        style: textTheme.displayMedium,
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //image and cover
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(
                      homePagePosterMap["imageAssets"]),
                  fit: BoxFit.cover)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //writer and publishDate
                  Text(
                      "${homePagePosterMap["writer"]} - ${homePagePosterMap["publisheDate"]}",
                      style: textTheme.titleMedium),
                  //view
                  Row(children: [
                    Text(homePagePosterMap["view"],
                        style: textTheme.titleMedium),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.remove_red_eye_sharp,
                      color: MyColors.posterSubTitle,
                    ),
                  ])
                ],
              ),
              //title
              Text(
                homePagePosterMap["title"],
                style: textTheme.displayLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
