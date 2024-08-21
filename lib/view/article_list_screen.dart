import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/component/text_style.dart';
import 'package:tech_blog/controlers/article_controler.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleControler articleControler = Get.put(ArticleControler());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var marginFromSide = size.width / 12.46;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.scafoldBackGround,
      appBar: techBlogAppBar(context, MyStrings.articlesList),
      body: Padding(
        padding: EdgeInsets.all(marginFromSide),
        child: SizedBox(
          child: Obx(
            () => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: articleControler.articleList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0,8,0,8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width/3,
                          height: Get.height/10,
                          child: CachedNetworkImage(
                            imageUrl: articleControler.articleList[index].image!,
                            imageBuilder: ((context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.cover)),
                              );
                            }),
                            placeholder: ((context, url) => loading()),
                            errorWidget: (context, url, error) {
                              return Icon(
                                Icons.image_not_supported,
                                size: 50,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width/2.5,
                              child: Text(articleControler.articleList[index].title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(articleControler.articleList[index].author!),
                                SizedBox(width: 20,),
                                Text(articleControler.articleList[index].view!+" بازدید "),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    ));
  }
}
