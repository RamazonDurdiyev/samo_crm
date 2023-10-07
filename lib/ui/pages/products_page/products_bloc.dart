import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/products_page/products_event.dart';
import 'package:samo_crm/ui/pages/products_page/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(Initial()) {
    on<ChangeProductsTabEvent>((event, emit) async {
      await _changeProductsTab(emit, event.value);
    });
  }

  // Data

  int currentIndex = 0;

  _changeProductsTab(Emitter<ProductsState> emit, int value) async {
    try {
      emit(ChangeProductsTabState(state: State.loading));
      currentIndex = value;
      emit(ChangeProductsTabState(state: State.loaded));
    } catch (e) {
      emit(ChangeProductsTabState(state: State.error));
    }
  }
}
