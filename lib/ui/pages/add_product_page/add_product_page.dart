import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_state.dart';

import 'add_product_event.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = AddProductBloc();
    bloc.add(ShowDialogEvent(context: context));
    return Scaffold(
      appBar: _buildAppBar(context, bloc),
      body: _buildBody(bloc),
    );
  }

  _buildAppBar(BuildContext context, AddProductBloc bloc) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: const Text(
        "Omborga kiritish",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
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
        ),
      ],
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          size: 28,
          color: Colors.indigo,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 0),
        child: Column(
          children: [
            _buildCustomDivider(),
          ],
        ),
      ),
    );
  }

  _buildBody(AddProductBloc bloc) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 56,
              ),
              _buildListView(bloc),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildFilterTab(bloc),
      ],
    );
  }

  _buildCustomDivider() {
    return Container(
      height: 1,
      color: Colors.indigo,
    );
  }

  _buildFilterTab(AddProductBloc bloc) {
    return DefaultTabController(
      length: 2,
      initialIndex: bloc.currentIndexOfTab,
      child: Container(
        margin: const EdgeInsets.only(right: 70, left: 70, top: 8),
        height: 40,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 236, 234, 234),
          borderRadius: BorderRadius.all(
            Radius.circular(
              100,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: TabBar(
            overlayColor: const MaterialStatePropertyAll(
              Colors.transparent,
            ),
            unselectedLabelColor: Colors.black38,
            labelColor: Colors.white,
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  100,
                ),
              ),
              color: Colors.indigo,
            ),
            onTap: (value) {
              bloc.add(
                ChangeTabEvent(value: value),
              );
            },
            tabs: const [
              Tab(
                height: 35,
                text: "Tayyor",
              ),
              Tab(
                height: 35,
                text: "Qismlar",
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildListView(AddProductBloc bloc) {
    return BlocBuilder<AddProductBloc, AddProductState>(
      bloc: bloc,
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return bloc.currentIndexOfTab == 0
                ? _buildListReadies()
                : _buildListParts();
          },
        );
      },
    );
  }

  _buildListParts() {
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
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.widgets_sharp,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "SSD part",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildListReadies() {
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
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Icon(
                Icons.widgets_sharp,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "SSD part",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
