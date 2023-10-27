import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
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
  }

  // Controllers

  TextEditingController countCtrl = TextEditingController();

  // Data

  List isItemExpanded = List.filled(20, false);
  List<String> localProducts = [];

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
}
