import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samo_crm/models/product_model/product_model.dart';
import 'package:samo_crm/ui/pages/products_cart_page/products_cart_event.dart';
import 'package:samo_crm/ui/pages/products_cart_page/products_cart_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsCartBloc extends Bloc<ProductsCartEvent, ProductsCartState> {
  ProductsCartBloc() : super(Initial()) {
    on<TryToExpandEvent>((event, emit) async {
      await _tryToExpand(emit, event.index);
    });
    on<GetLocalProductsEvent>((event, emit) async {
      await _getLocalProducts(emit);
    });
    on<DeleteLocalProductEvent>((event, emit) async {
      await _deleteLocalProduct(emit, event.product);
    });
    on<SortProductsEvent>((event, emit) async {
      await _sortProducts(emit,event.categoryName);
    });
  }

  // Controllers

  TextEditingController countCtrl = TextEditingController();

  // Data

  List isItemExpanded = List.filled(20, false);
  List<String> localProducts = [];
  List categoryNames = [];
  List<String> sortProducts = [];

  _tryToExpand(Emitter<ProductsCartState> emit, int index) {
    try {
      emit(TryToExpandState(state: State.loading));
      isItemExpanded[index] = !isItemExpanded[index];
      emit(TryToExpandState(state: State.loaded));
    } catch (e) {
      emit(TryToExpandState(state: State.error));
    }
  }

  _getLocalProducts(Emitter<ProductsCartState> emit) async {
    try {
      emit(GetLocalProductsState(state: State.loading));
      final prefs = await SharedPreferences.getInstance();
      localProducts = prefs.getStringList("cart_products") ?? [];
      for (var i = 0; i < localProducts.length; i++) {
        if (!categoryNames.contains(
            CartProductModel.fromJson(json.decode(localProducts[i]))
                .categoryName)) {
          categoryNames.add(
              CartProductModel.fromJson(json.decode(localProducts[i]))
                  .categoryName);
        }
      }

      if (kDebugMode) {
        print(
            "ProductsCartBloc _getLocalProducts localProducts => $localProducts");
      }
      emit(GetLocalProductsState(state: State.loaded));
    } catch (e) {
      emit(GetLocalProductsState(state: State.error));
      if (kDebugMode) {
        print("ProductsCartBloc _getLocalProducts error => $e");
      }
    }
  }

  _deleteLocalProduct(
      Emitter<ProductsCartState> emit, CartProductModel product) async {
    try {
      emit(DeleteLocalProductState(state: State.loading));
      final prefs = await SharedPreferences.getInstance();
      localProducts = prefs.getStringList("cart_products") ?? [];
      localProducts.remove(json.encode(product.toJson()));
      prefs.setStringList("cart_products", localProducts);
      if (kDebugMode) {
        print(
            "ProductsCartBloc _deleteLocalProducts product deleted succesfully");
      }
      Fluttertoast.showToast(
        msg: "Succesfully deleted",
        backgroundColor: Colors.indigo,
        textColor: Colors.white,
      );
      emit(DeleteLocalProductState(state: State.loaded));
    } catch (e) {
      emit(DeleteLocalProductState(state: State.error));
      if (kDebugMode) {
        print("ProductsCartBloc _deleteLocalProducts error => $e");
      }
    }
  }

  _sortProducts(Emitter<ProductsCartState> emit,
      String categoryName) async {
    try {
      emit(SortProductsState(state: State.loading));
      final prefs = await SharedPreferences.getInstance();
      localProducts = prefs.getStringList("cart_products")??[];
      for (var i = 0; i < localProducts.length; i++) {
        if (CartProductModel.fromJson(json.decode(localProducts[i])).categoryName ==
            categoryName) {
          sortProducts.add(localProducts[i]);
        }
      }
      print("sort category => $categoryName => $sortProducts");
      emit(SortProductsState(state: State.loaded));
    } catch (e) {
      emit(SortProductsState(state: State.error));
      if (kDebugMode) {
        print("ProductsCartBloc _sortProducts error => $e");
      }
    }
  }
}
