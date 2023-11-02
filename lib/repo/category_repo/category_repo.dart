import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:samo_crm/core/app_const/app_const.dart';
import 'package:samo_crm/models/category_model/category_model.dart';
import 'package:samo_crm/models/product_model/product_model.dart';

class CategoryRepo {
  // final NetworkInfo networkInfo;
  final Dio client = Dio();

  // CategoryRepo({
  //   // required this.networkInfo,
  // });

  Future<List<CategoryModel>> fetchCategories() async {
    // if (await networkInfo.isConnected) {
      final res = await client.get(
        GET_ALL_CATEGORIES_API,
        options: Options(
          headers: {"Access-Control-Allow-Origin": ":*"},
        ),
      );
      if (kDebugMode) {
        print("fetchCategories data => $res");
      }
      return res.data["data"].map<CategoryModel>(
        (category) {
          return CategoryModel.fromJson(category);
        },
      ).toList();
    // } else {
    //   throw NetworkException();
    // }
  }

///////////////////////////////////////////////////////////
//// ************** Fetch Category By Id ************* ////
///////////////////////////////////////////////////////////

Future <List<ProductModel>> fetchCategoryById(int id) async {
    // if (await networkInfo.isConnected) {
      final res = await client.get(
        "$GET_CATEGORY_BY_ID_API$id",
        options: Options(
          headers: {"Access-Control-Allow-Origin": ":*"},
        ),
      );
      if (kDebugMode) {
        print("fetchCategories data => $res");
      }
      return res.data["data"].map<ProductModel>(
        (product) {
          return ProductModel.fromJson(product);
        },
      ).toList();
    // } else {
    //   throw NetworkException();
    // }
  }
  
}
