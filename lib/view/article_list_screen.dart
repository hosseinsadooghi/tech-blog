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
    
    return SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.scafoldBackGround,
          appBar: techBlogAppBar(context,MyStrings.articlesList),
          body: Obx(
            () => ListView.builder(
              itemCount: articleControler.articleList.length,
              itemBuilder: (context,index){
                
              }
            ),
          ),
    ));
  }
}
