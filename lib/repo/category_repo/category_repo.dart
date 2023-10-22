import 'package:dio/dio.dart';
import 'package:samo_crm/core/app_const/app_const.dart';
import 'package:samo_crm/core/exceptions/exceptions.dart';
import 'package:samo_crm/core/network/network_info.dart';
import 'package:samo_crm/models/category_model/category_model.dart';
  // final NetworkInfo networkInfo = N;
class CategoryRepo {
NetworkInfo? networkInfo;
final Dio client = Dio();

  

  // CategoryRepo({
  //   required this.client,
  //   required this.networkInfo,
  // });

  Future fetchCategories() async {
    print("fetch categories function in repo called");
    // if (await networkInfo.isConnected) {
      final res = await client.get(
        GET_CATEGORIES_API,
        options: Options(
          headers: {"Access-Control-Allow-Origin": ":*"},
        ),
      );
      print(res);
      return res;
    // } else {
    //   throw NetworkException();
    // }
  }
}
