import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);
    }
  }
}
