import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/remove_products_page/remove_products_event.dart';
import 'package:samo_crm/ui/pages/remove_products_page/remove_products_state.dart';

class RemoveProductBloc extends Bloc<RemoveProductEvent, RemoveProductState> {
  RemoveProductBloc() : super(Initial()) {
    on<ChangeRemoveTabEvent>((event, emit) async {
      await changeTab(emit, event.value);
    });
  }

  // Controllers

  TextEditingController addressCtrl = TextEditingController();

  // Data

  int currentIndexOfTab = 0;

  changeTab(Emitter<RemoveProductState> emit, int value) {
    try {
      emit(ChangeRemoveTabState(state: State.loading));
      currentIndexOfTab = value;
      emit(ChangeRemoveTabState(state: State.loaded));
    } catch (e) {
      emit(ChangeRemoveTabState(state: State.error));
    }
  }
}
