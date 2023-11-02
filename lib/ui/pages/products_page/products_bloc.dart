import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      final res = await repo.fetchCategories() ;
      categoriesList = res;
      emit(FetchCategoriesState(state: State.loaded));
    } catch (e) {
      emit(FetchCategoriesState(state: State.error));
      if (kDebugMode) {
        print("ProductsBloc _fetchCategories error => $e");
      }
    }
  }
}
