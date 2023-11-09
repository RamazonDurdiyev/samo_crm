import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:samo_crm/core/app_const/app_const.dart';
import 'package:samo_crm/models/history_model/history_model.dart';

class HistoryRepo {
  Dio client = Dio();

   Future<List<HistoryModel>> fetchHistories() async {
    // if (await networkInfo.isConnected) {
      final res = await client.get(
        FETCH_HISTORIES_API,
        options: Options(
          headers: {"Access-Control-Allow-Origin": ":*"},
        ),
      );
      if (kDebugMode) {
        print("fetchHistories data => $res");
      }
      return res.data["data"].map<HistoryModel>(
        (history) {
          return HistoryModel.fromJson(history);
        },
      ).toList();
    // } else {
    //   throw NetworkException();
    // }
  }

///////////////////////////////////////////////////////////
//// ************** Fetch history By Id ************* ////
///////////////////////////////////////////////////////////

Future <List<HistoryDetailModel>> fetchHistoriesById(int id) async {
    // if (await networkInfo.isConnected) {
      final res = await client.get(
        "$GET_PRODUCT_BY_ID$id",
        options: Options(
          headers: {"Access-Control-Allow-Origin": ":*"},
        ),
      );
      if (kDebugMode) {
        print("fetchCategories data => $res");
      }
      return res.data["data"].map<HistoryDetailModel>(
        (product) {
          return HistoryDetailModel.fromJson(product);
        },
      ).toList();
    // } else {
    //   throw NetworkException();
    // }
  }

}