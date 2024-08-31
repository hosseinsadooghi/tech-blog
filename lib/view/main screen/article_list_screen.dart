import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/controlers/article_list_controler.dart';
import 'package:tech_blog/controlers/single_article_controler.dart';
import 'package:tech_blog/view/main%20screen/article_single_screen.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListControler articleListControler = Get.put(ArticleListControler());
  SingleArticleControler singleArticleControler =
      Get.put(SingleArticleControler());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var marginFromSide = size.width / 12.46;
    return Obx(() => articleListControler.loading == false
        ? SafeArea(
            child: Scaffold(
            backgroundColor: MyColors.scafoldBackGround,
            //appbar
            appBar: techBlogAppBar(context, MyStrings.articlesList),
            //body
            body: Padding(
              padding:
                  EdgeInsets.fromLTRB(marginFromSide, 0, marginFromSide, 0),
              child: SizedBox(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: articleListControler.articleList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          singleArticleControler.id.value = int.parse(articleListControler.articleList[index].id!);
                          Get.to(ArticleSingleScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //image
                              SizedBox(
                                width: size.width / 3,
                                height: size.height / 10,
                                child: CachedNetworkImage(
                                  imageUrl: articleListControler
                                      .articleList[index].image!,
                                  imageBuilder: ((context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
                                    );
                                  }),
                                  placeholder: ((context, url) => loading()),
                                  errorWidget: (context, url, error) {
                                    return Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 50,
                                    );
                                  },
                                ),
                              ),
                              //space between image and title
                              SizedBox(
                                width: 16,
                              ),
                              SizedBox(
                                width: size.width / 2.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //title
                                    SizedBox(
                                      width: size.width / 2.5,
                                      child: Text(
                                        articleListControler
                                            .articleList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    //author and view
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //author
                                        Text(articleListControler
                                            .articleList[index].author!),
                                        //view
                                        Text(articleListControler
                                                .articleList[index].view! +
                                            " بازدید "),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ))
        : Center(
            child: loading(),
          ));
  }
}
