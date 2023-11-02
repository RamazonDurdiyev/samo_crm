import 'package:dio/dio.dart';
import 'package:samo_crm/core/app_const/app_const.dart';
import 'package:samo_crm/models/post_product_model/post_product_model.dart';


class CategoryRepo {
  final Dio client = Dio();


    Future<bool> setComment(PostProductModel newProduct) async {
   
    // if (await networkInfo.isConnected) {
      await client.post(
        POST_PRODUCT_API,
        data: newProduct.toJson(),
      );
      return true;
    // } else {
      // throw NetworkException();
    // }
  }
}
