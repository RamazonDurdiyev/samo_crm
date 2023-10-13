import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_event.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(Initial()) {
    on<ChangeTabEvent>((event, emit) async {
      await _changeTab(emit, event.value);
    });
    on<TryToExpandEvent>((event, emit) async {
      await _tryToExpand(emit,event.index);
    });
  }

  // Controllers

  TextEditingController searchProductCtrl = TextEditingController();

  // Data

  int currentIndexOfTab = 0;
  List isExpandedItems = List.filled(20,false);

  _changeTab(Emitter<AddProductState> emit, int value) async {
    try {
      emit(ChangeTabState(state: State.loading));
      currentIndexOfTab = value;
      emit(ChangeTabState(state: State.loaded));
    } catch (e) {
      emit(ChangeTabState(state: State.error));
    }
  }

  _tryToExpand(Emitter<AddProductState> emit,int index) {
    try {
      emit(TryToExpandState(state: State.loading));
      isExpandedItems[index] = !isExpandedItems[index];
      emit(TryToExpandState(state: State.loaded));
    } catch (e) {
      emit(TryToExpandState(state: State.error));
    }
  }
}
