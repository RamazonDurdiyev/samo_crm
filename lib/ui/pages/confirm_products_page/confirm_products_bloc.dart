import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/models/product_model/product_model.dart';
import 'package:samo_crm/repo/product_repo/product_repo.dart';
import 'package:samo_crm/ui/pages/confirm_products_page/confirm_products_event.dart';
import 'package:samo_crm/ui/pages/confirm_products_page/confirm_products_state.dart';

class ConfirmProductsBloc extends Bloc<ConfirmProductsEvent,ConfirmProductsState>{
  ConfirmProductsBloc():super(Initial()){
    on<FetchUnconfirmedsEvent>((event, emit)async{
      await _fetchUnconfirmeds(emit);
    });
  }

  // Data

  ProductRepo repo = ProductRepo();
  List<UnconfirmedProductsModel> unconfirmeds = [];
  
  _fetchUnconfirmeds(Emitter<ConfirmProductsState> emit) async{
    try {
      emit(FetchUnconfirmedsState(state: State.loading));
      unconfirmeds = await repo.fetchUnconfirmeds();
      emit(FetchUnconfirmedsState(state: State.loaded));
    } catch (e) {
      emit(FetchUnconfirmedsState(state: State.error));
      if (kDebugMode) {
        print("ConfirmProductsBloc _fetchUnconfirmeds error => $e");
      }
    }
  }

}