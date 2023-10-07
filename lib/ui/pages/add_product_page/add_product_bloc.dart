import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_event.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(Initial()) {
    on<ChangeTabEvent>((event, emit) async {
      await _changeTab(emit, event.value);
    });
  }

  // Controllers

  TextEditingController searchProductCtrl = TextEditingController();

  // Data

  int currentIndexOfTab = 0;

  _changeTab(Emitter<AddProductState> emit, int value) async {
    try {
      emit(ChangeTabState(state: State.loading));
      currentIndexOfTab = value;
      emit(ChangeTabState(state: State.loaded));
    } catch (e) {
      emit(ChangeTabState(state: State.error));
    }
  }
}
