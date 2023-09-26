import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_event.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(Initial()) {
    on<ShowDialogEvent>((event, emit) async {
      await popUpDialog(emit, event.context);
    });
    on<ChangeTabEvent>((event, emit) async {
      await changeTab(emit, event.value);
    });
  }

  // Controllers

  TextEditingController addressCtrl = TextEditingController();

  // Data

  int currentIndexOfTab = 0;

  popUpDialog(Emitter<AddProductState> emit, BuildContext context) async {
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

  changeTab(Emitter<AddProductState> emit, int value) async {
    try {
      emit(ChangeTabState(state: State.loading));
      currentIndexOfTab = value;
      emit(ChangeTabState(state: State.loaded));
      print(currentIndexOfTab);
    } catch (e) {
      emit(ChangeTabState(state: State.error));
    }
  }
}
