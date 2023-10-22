import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/products_cart_page/products_cart_page.dart';
import 'package:samo_crm/ui/pages/remove_products_page/remove_products_bloc.dart';
import 'package:samo_crm/ui/pages/remove_products_page/remove_products_event.dart';
import 'package:samo_crm/ui/pages/remove_products_page/remove_products_state.dart';

class RemoveProductPage extends StatelessWidget {
  const RemoveProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = RemoveProductBloc();
    return Scaffold(
      appBar: _buildAppBar(context, bloc),
      body: _buildBody(bloc),
    );
  }

  _buildAppBar(BuildContext context, RemoveProductBloc bloc) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: _buildSearchTextField(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CartPage();
                  },
                ),
              );
            },
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.indigo,
              size: 28,
            ),
          ),
        ),
      ],
      leadingWidth: 32,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(
            Icons.arrow_back,
            size: 28,
            color: Colors.indigo,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 44),
        child: Column(
          children: [
            _buildCustomDivider(),
            const SizedBox(
              height: 8,
            ),
            _buildFilterTab(bloc),
          ],
        ),
      ),
    );
  }

  _buildBody(RemoveProductBloc bloc) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          _buildListView(bloc),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  _buildSearchTextField() {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: TextEditingController(),
        cursorColor: Colors.indigo,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.indigo,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          hintText: "Qidirish...",
          hintStyle:
              TextStyle(color: Colors.grey, fontSize: 16, fontFamily: "Lato"),
          fillColor: Color.fromARGB(255, 236, 234, 234),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  _buildCustomDivider() {
    return Container(
      height: 1,
      color: Colors.indigo,
    );
  }

  _buildFilterTab(RemoveProductBloc bloc) {
    return DefaultTabController(
      length: 6,
      initialIndex: bloc.currentIndexOfTab,
      child: TabBar(
        padding: const EdgeInsets.only(left: 16),
        isScrollable: true,
        splashBorderRadius: const BorderRadius.all(
          Radius.circular(
            100,
          ),
        ),
        unselectedLabelColor: Colors.grey,
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
            ChangeRemoveTabEvent(value: value),
          );
        },
        tabs: const [
          Tab(
            height: 35,
            text: "All",
          ),
          Tab(
            height: 35,
            text: "Tayyor",
          ),
          Tab(
            height: 35,
            text: "Qismlar",
          ),
          Tab(
            height: 35,
            text: "PC",
          ),
          Tab(
            height: 35,
            text: "Tablet",
          ),
          Tab(
            height: 35,
            text: "Phone",
          ),
        ],
      ),
    );
  }

  _buildListView(RemoveProductBloc bloc) {
    return BlocBuilder<RemoveProductBloc, RemoveProductState>(
      bloc: bloc,
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return bloc.currentIndexOfTab == 0
                ? _buildListItemReadies(bloc, index)
                : _buildListItemParts(bloc, index);
          },
        );
      },
    );
  }

  _buildListItemParts(RemoveProductBloc bloc, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.widgets_sharp,
                     color: Colors.indigo,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "SSD part",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      bloc.add(TryToExpandRemovePageEvent(index: index));
                    },
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              bloc.isExpandedItems[index] == true
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return _buildPartsChildren("Acer");
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  _buildPartsChildren(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildListItemReadies(RemoveProductBloc bloc, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.widgets_sharp,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "Monobloc",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      bloc.add(TryToExpandRemovePageEvent(index: index));
                    },
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              bloc.isExpandedItems[index] == true
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return _buildReadiesChildren("Acer");
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  _buildReadiesChildren(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
