import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class SingleArticleControler extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;

  @override
  onInit() {
    super.onInit();
  }

  getArticleInfo() async {
    loading.value = true;
    //TODO: hard cod userId
    var userId = '';
    print(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=1&user_id=$userId');
    print("ok");
    if (response.statusCode == 200) {
      print("ok");
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }
  }
}
