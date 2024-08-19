import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/component/text_style.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
      appBar: techBlogAppBar(context,MyStrings.articlesList),
    ));
  }
}
