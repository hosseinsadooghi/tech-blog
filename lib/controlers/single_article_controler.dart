import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class SingleArticleControler extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  @override
  onInit() {
    super.onInit();
    getArticleInfo();
  }

  getArticleInfo() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {});

      loading.value = false;
    }
  }
}
