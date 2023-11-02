import 'dart:convert';

import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/models/product_model/product_model.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_page.dart';
import 'package:samo_crm/ui/pages/products_cart_page/products_cart_state.dart';

import 'products_cart_bloc.dart';
import 'products_cart_event.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = ProductsCartBloc();
    bloc.add(GetLocalProductsEvent());
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(bloc),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddProductPage();
              },
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  _buildBody(ProductsCartBloc bloc) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          _buildProductsList(bloc),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: const Text(
        "Savat",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.delete,
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
        preferredSize: const Size(double.infinity, 0),
        child: Column(
          children: [
            _buildCustomDivider(),
          ],
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

  _buildProductsList(ProductsCartBloc bloc) {
    return BlocBuilder<ProductsCartBloc, ProductsCartState>(
      bloc: bloc,
      builder: (context, state) {
        final isLoading =
            state is GetLocalProductsState && state.state == State.loading;
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          itemCount: isLoading ? 0 : bloc.localProducts.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildProductsItem(bloc, index,isLoading);
          },
        );
      },
    );
  }

  _buildProductsItem(ProductsCartBloc bloc, int parentIndex, bool isLoading) {
    final product = ProductItemModel.fromJson(
      json.decode(
        bloc.localProducts[parentIndex],
      ),
    );
    return Card(
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Need to fill",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "700 \$",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Text(
                  "120",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bloc.add(TryToExpandEvent(index: parentIndex));
                  },
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            bloc.isItemExpanded[parentIndex] == true
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: isLoading ? 0 : bloc.localProducts.length,
                    itemBuilder: (context, index) {
                      return _buildProductsChild(
                          context, bloc, product.name ?? "");
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildProductsChild(
      BuildContext context, ProductsCartBloc bloc, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              showDialog(
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
                    title: const Text(
                      "Tahrirlash",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: _buildTextField(bloc.countCtrl, "Sonini kiriting"),
                  );
                },
              );
            },
            child: const Icon(
              Icons.edit,
              size: 16,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }

  _buildTextField(TextEditingController ctrl, String hint) {
    return SizedBox(
      child: TextField(
        controller: ctrl,
        keyboardType: TextInputType.number,
        cursorColor: Colors.indigo,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 16, fontFamily: "Lato"),
          fillColor: const Color.fromARGB(255, 236, 234, 234),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
