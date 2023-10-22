import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/core/network/network_info.dart';
import 'package:samo_crm/models/category_model/category_model.dart';
import 'package:samo_crm/repo/category_repo/category_repo.dart';
import 'package:samo_crm/ui/pages/products_page/products_event.dart';
import 'package:samo_crm/ui/pages/products_page/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(Initial()) {
    on<ChangeProductsTabEvent>((event, emit) async {
      await _changeProductsTab(emit, event.value);
    });
    on<FetchCategoriesEvent>((event, emit) async {
      await _fetchCategories(emit);
    });
  }

  // Data

  int currentIndex = 0;
  CategoryRepo repo = CategoryRepo();
  List<CategoryModel> categoriesList = [];

  _changeProductsTab(Emitter<ProductsState> emit, int value) async {
    try {
      emit(ChangeProductsTabState(state: State.loading));
      currentIndex = value;
      emit(ChangeProductsTabState(state: State.loaded));
    } catch (e) {
      emit(ChangeProductsTabState(state: State.error));
    }
  }

  _fetchCategories(Emitter<ProductsState> emit) async {
    try {
      emit(FetchCategoriesState(state: State.loading));
      print("fetch categories bloc called");
      final res = await repo.fetchCategories();
      categoriesList = res;
      print("$categoriesList +++++++++++++++++++++++++");
      emit(FetchCategoriesState(state: State.loaded));
    } catch (e) {
      emit(FetchCategoriesState(state: State.error));
      print("error fetch category => $e");
    }
  }
}
