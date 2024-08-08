import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList tagList = RxList();
  RxList topVisitedList = RxList();
  RxList topPodcastList = RxList();
  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    response.data['poster'];
    response.data['top_visited'];
    response.data['top_podcasts'];
    response.data['tags'];
  }
}
