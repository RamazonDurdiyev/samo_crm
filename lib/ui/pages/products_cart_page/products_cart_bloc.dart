import 'package:flutter/widgets.dart'hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/products_cart_page/products_cart_event.dart';
import 'package:samo_crm/ui/pages/products_cart_page/products_cart_state.dart';

class ProductsCartBloc extends Bloc<ProductsCartEvent, ProductsCartState> {
  ProductsCartBloc() : super(Initial()) {
    on<TryToExpandEvent>((event, emit) async {
      await _tryToExpand(emit, event.index);
    });
  }

  // Controllers

  TextEditingController countCtrl = TextEditingController();

  // Data

  List isItemExpanded = List.filled(20, false);

  _tryToExpand(Emitter<ProductsCartState> emit, int index) {
    try {
      emit(TryToExpandState(state: State.loading));
      isItemExpanded[index] = !isItemExpanded[index];
      emit(TryToExpandState(state: State.loaded));
    } catch (e) {
      emit(TryToExpandState(state: State.error));
    }
  }
}
