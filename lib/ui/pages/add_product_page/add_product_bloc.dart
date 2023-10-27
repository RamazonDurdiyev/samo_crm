import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/models/category_item_model/category_item_model.dart';
import 'package:samo_crm/models/category_model/category_model.dart';
import 'package:samo_crm/repo/category_repo/category_repo.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_event.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(Initial()) {
    on<ChangeTabEvent>((event, emit) async {
      await _changeTab(emit, event.value);
    });
    on<TryToExpandEvent>((event, emit) async {
      await _tryToExpand(emit, event.index);
    });
    on<AddFetchCategoriesEvent>((event, emit) async {
      await _fetchCategories(emit);
    });
    on<FetchCategoryByIdEvent>((event, emit) async {
      await _fetchCategoryById(emit, event.id);
    });
    on<SaveLocalToCartEvent>((event, emit) async {
      await _saveLocalToCart(emit, event.product);
    });
  }

  // Controllers

  TextEditingController searchProductCtrl = TextEditingController();

  // Data
  CategoryRepo repo = CategoryRepo();
  List<CategoryModel> categoriesList = [];
  List<String> localProducts = [];
  CategoryModel categoryById = CategoryModel();
  CategoryItemModel categoryItem = CategoryItemModel();
  int currentIndexOfTab = 0;
  List isExpandedItems = List.filled(20, false);

  _changeTab(Emitter<AddProductState> emit, int value) async {
    try {
      emit(ChangeTabState(state: State.loading));
      currentIndexOfTab = value;
      emit(ChangeTabState(state: State.loaded));
    } catch (e) {
      emit(ChangeTabState(state: State.error));
    }
  }

  _tryToExpand(Emitter<AddProductState> emit, int index) {
    try {
      emit(TryToExpandState(state: State.loading));
      isExpandedItems[index] = !isExpandedItems[index];
      emit(TryToExpandState(state: State.loaded));
    } catch (e) {
      emit(TryToExpandState(state: State.error));
    }
  }

  _fetchCategories(Emitter<AddProductState> emit) async {
    try {
      emit(AddFetchCategoriesState(state: State.loading));
      final res = await repo.fetchCategories();
      categoriesList = res;
      if (kDebugMode) {
        print(
            "AddProductBloc _fetchCategories categoriesList => $categoriesList");
      }
      emit(AddFetchCategoriesState(state: State.loaded));
    } catch (e) {
      emit(AddFetchCategoriesState(state: State.error));
      if (kDebugMode) {
        print("AddProductBloc _fetchCategories error => $e");
      }
    }
  }

  _saveLocalToCart(Emitter<AddProductState> emit, CategoryModel product) async {
    try {
      emit(SaveLocalToCartState(state: State.loading));
      final prefs = await SharedPreferences.getInstance();
      localProducts.add(json.encode(product.toJson()));
      prefs.setStringList(
        "cart_products",
        localProducts,
      );
      if (kDebugMode) {
        print(
            "AddProductsBloc _saveLocalToCart product saved succesfully, local products => $localProducts");
      }
      emit(SaveLocalToCartState(state: State.loaded));
    } catch (e) {
      emit(SaveLocalToCartState(state: State.error));
      if (kDebugMode) {
        print("AddProductBloc _saveLocalToCart error => $e");
      }
    }
  }

  _fetchCategoryById(Emitter<AddProductState> emit, int id) async {
    try {
      emit(FetchCategoryByIdState(state: State.loading));
      categoryById = await repo.fetchCategoryById(id);
     
      emit(FetchCategoryByIdState(state: State.loaded));
    } catch (e) {}
  }
}
