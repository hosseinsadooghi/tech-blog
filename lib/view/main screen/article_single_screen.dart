import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controlers/single_article_controler.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ArticleSingleScreen extends StatefulWidget {
  ArticleSingleScreen({super.key});

  @override
  State<ArticleSingleScreen> createState() => _ArticleSingleScreenState();
}

class _ArticleSingleScreenState extends State<ArticleSingleScreen> {
  SingleArticleControler singleArticleControler =
      Get.put(SingleArticleControler());

  @override
  void initState() {
    super.initState();
    singleArticleControler.getArticleInfo();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var marginFromSide = size.width / 12.46;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.scafoldBackGround,
      body: Obx(
        () => Column(
          children: [
            Stack(
              children: [
                //poster image
                CachedNetworkImage(
                  imageUrl:
                      singleArticleControler.articleInfoModel.value.image!,
                  imageBuilder: (context, imageProvider) {
                    return Image(image: imageProvider);
                  },
                  placeholder: (context, url) {
                    return loading();
                  },
                  errorWidget: (context, url, error) {
                    return Assets.images.valhalla.image();
                  },
                ),
                //navigation bar
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradientColors.homePosterCoverGradient,
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          //back icon
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                          Expanded(child: SizedBox()),
                          //bookmark icon
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          //share icon
                          Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  marginFromSide / 2, 0, marginFromSide / 2, 0),
              child: Column(
                children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      singleArticleControler.articleInfoModel.value.title!,
                      maxLines: 2,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  Row(
                    children: [
                      //avatar
                      Image(
                        image: Image.asset(Assets.icons.avatar.path).image,
                        height: 50,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      //writer name
                      Text(
                        singleArticleControler.articleInfoModel.value.author!,
                        style: textTheme.labelMedium,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      //date
                      Text(
                        singleArticleControler
                            .articleInfoModel.value.createdAt!,
                        style: textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  //                 HtmlWidget(
                  //                   '''
                  // <h1>This is the biggest one</h1>
                  // <h2>This one is a little smaller</h2>
                  // <h3>This one is even smaller</h3>
                  // <h4>They keep getting smaller</h4>
                  // <h5>This one isn't even that big</h5>
                  // <h6>Pretty small now, actually</h6>
                  // ''',
                  //                   textStyle: textTheme.bodySmall,
                  //                   enableCaching: true,
                  //                   onLoadingBuilder: (context, element, loadingProgress) => loading(),
                  //                 )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
