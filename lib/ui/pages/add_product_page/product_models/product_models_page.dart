import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_event.dart';

class ProductModelsPage extends StatelessWidget {
  const ProductModelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = AddProductBloc();
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context, bloc),
    );
  }

  _buildBody(BuildContext context, AddProductBloc bloc) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          _buildModelsList(bloc),
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
        "CPU",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
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

  _buildCustomDivider() {
    return Container(
      height: 1,
      color: Colors.indigo,
    );
  }

  _buildModelsList(AddProductBloc bloc) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 12,
          itemBuilder: (context, index) {
            return _buildModel(bloc, index);
          },
        );
      },
    );
  }

  _buildModel(AddProductBloc bloc, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Core i5",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        100,
                      ),
                    ),
                    onTap: () {
                      bloc.add(
                        TryToExpandEvent(
                          index: index,
                        ),
                      );
                    },
                    child: Icon(
                      bloc.isExpandedItems[index] == true
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            bloc.isExpandedItems[index] == true
                ? _buildModelChildList()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildModelChildList() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildModelChild();
      },
    );
  }

  _buildModelChild() {
    return const Text(
      "i5 10",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
