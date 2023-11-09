import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/models/history_model/history_model.dart';
import 'package:samo_crm/repo/history_repo/history_repo.dart';
import 'package:samo_crm/ui/pages/history_page/history_event.dart';
import 'package:samo_crm/ui/pages/history_page/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(Initial()) {
    on<FetchHistoriesEvent>((event, emit) async {
      await _fetchHistories(emit);
    });
  }

  // Data

  HistoryRepo repo = HistoryRepo();
  List<HistoryModel> histories = [];

  _fetchHistories(Emitter<HistoryState> emit) async {
    try {
      emit(FetchHistoriesState(state: State.loading));
      histories = await repo.fetchHistories();
      if (kDebugMode) {
        print("HistoryBloc _fetchHistories histories => $histories");
      }
      emit(FetchHistoriesState(state: State.loaded));
    } catch (e) {
      emit(FetchHistoriesState(state: State.error));
      if (kDebugMode) {
        print("HistoryBloc _fetchHistories error => $e");
      }
    }
  }
}
