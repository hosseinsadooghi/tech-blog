

import 'package:flutter/cupertino.dart';

class HashTagModel {
  String title;

  HashTagModel({required this.title});
}

class BlogModel {
  int id;
  String bannerUrl;
  String title;
  String imageUrl;
  String writer;
  String publishDate;
  String content;
  String views;

  BlogModel({
    required this.id,
    required this.bannerUrl,
    required this.title,
    required this.imageUrl,
    required this.writer,
    required this.publishDate,
    required this.content,
    required this.views,
  });
}

class PodCastModel {
  int id;
  Image bannerUrl;
  String name;
  String imageUrl;
  String owner;
  String views;

  PodCastModel({
    required this.id,
    required this.bannerUrl,
    required this.name,
    required this.imageUrl,
    required this.owner,
    required this.views,
  });
}
