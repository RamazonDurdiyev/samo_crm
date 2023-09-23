import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/warehouse_in_page/warehouse_in_bloc.dart';
import 'package:samo_crm/ui/pages/warehouse_in_page/warehouse_in_event.dart';
import 'package:samo_crm/ui/pages/warehouse_in_page/warehouse_in_state.dart';

class WarehouseInPage extends StatelessWidget {
  const WarehouseInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = WarehouseInBloc();
    bloc.add(ShowDialogEvent(context: context));
    return Scaffold(
      body: _buildBody(bloc),
    );
  }

  _buildBody(WarehouseInBloc bloc) {
    return BlocBuilder<WarehouseInBloc, WarehouseInState>(
      bloc: bloc,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().statusBarHeight + 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Colors.indigo,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      "Omborga kiritish",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return const NotificationPage();
                        //     },
                        //   ),
                        // );
                      },
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.indigo,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 1,
                color: Colors.indigo,
              ),
              const SizedBox(
                height: 8,
              ),
              _buildFilterTab(bloc),
              const SizedBox(
                height: 16,
              ),
              _buildListView(),
            ],
          ),
        );
      },
    );
  }

  _buildFilterTab(WarehouseInBloc bloc) {
    return BlocBuilder<WarehouseInBloc,WarehouseInState>(
      bloc: bloc,
      builder: (context,state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Container(
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              color: Color.fromARGB(255, 236, 234, 234),
            ),
            child: bloc.changer == false
                ? Row(
                    children: [
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bloc.add(ChangeTabEvent());
                          },
                          child: Container(
                            height: 35,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Tayyor",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              "Qismlar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              "Tayyor",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bloc.add(ChangeTabEvent());
                          },
                          child: Container(
                            height: 35,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Qismlar",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
          ),
        );
      }
    );
  }

  _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildListItem();
      },
    );
  }

  _buildListItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        elevation: 3,
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
