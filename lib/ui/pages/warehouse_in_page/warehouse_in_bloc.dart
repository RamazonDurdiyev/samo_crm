import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/warehouse_in_page/warehouse_in_event.dart';
import 'package:samo_crm/ui/pages/warehouse_in_page/warehouse_in_state.dart';

class WarehouseInBloc extends Bloc<WarehouseInEvent, WarehouseInState> {
  WarehouseInBloc() : super(Initial()) {
    on<ShowDialogEvent>((event, emit) async {
      await popUpDialog(emit, event.context);
    });
    on<ChangeTabEvent>((event, emit) async {
      await changeTab(emit);
    });
  }

  // Controllers
  TextEditingController addressCtrl = TextEditingController();

  // Data
  bool changer = false;

  popUpDialog(Emitter<WarehouseInState> emit, BuildContext context) async {
    try {
      ShowDialogState(state: State.loading);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            titlePadding: const EdgeInsets.only(top: 32, bottom: 16, left: 16),
            title: const Text(
              "Qayerdan olib kelindi?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SizedBox(
              child: TextField(
                controller: addressCtrl,
                cursorColor: Colors.indigo,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: "Manzil",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 16, fontFamily: "Lato"),
                  fillColor: Color.fromARGB(255, 236, 234, 234),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      );
      ShowDialogState(state: State.loaded);
    } catch (e) {
      ShowDialogState(state: State.error);
    }
  }

  changeTab(Emitter<WarehouseInState> emit) {
    try {
      ChangeTabState(state: State.loading);
      changer = !changer;
      ChangeTabState(state: State.loaded);
      print(changer);
    } catch (e) {
      ChangeTabState(state: State.error);
    }
  }
}
