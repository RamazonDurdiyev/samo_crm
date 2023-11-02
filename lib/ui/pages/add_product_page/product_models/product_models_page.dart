import 'package:flutter/material.dart' hide State;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_bloc.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_event.dart';
import 'package:samo_crm/ui/pages/add_product_page/add_product_state.dart';

class ProductModelsPage extends StatelessWidget {
  const ProductModelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final bloc = AddProductBloc();
    bloc.add(
      FetchCategoryByIdEvent(
        id: args["id"],
      ),
    );
    return Scaffold(
      appBar: _buildAppBar(context, bloc, args),
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

  _buildAppBar(BuildContext context, AddProductBloc bloc, Map args) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: BlocBuilder<AddProductBloc, AddProductState>(
        bloc: bloc,
        builder: (context, state) {
          return Text(
            args["category_item_name"],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          );
        },
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
        final isLoading =
            state is FetchCategoryByIdState && state.state == State.loading;
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: isLoading ? 0 : bloc.productsById.length,
          itemBuilder: (context, index) {
            return _buildModel(bloc, index, isLoading);
          },
        );
      },
    );
  }

  _buildModel(AddProductBloc bloc, int index, bool isLoading) {
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
                  Text(
                    bloc.productsById[index].name ?? "",
                    style: const TextStyle(
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
                ? _buildModelChildList(bloc, index, isLoading)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildModelChildList(AddProductBloc bloc, int parentIndex, bool isLoading) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          isLoading ? 0 : bloc.productsById[parentIndex].children?.length,
      itemBuilder: (context, index) {
        return _buildModelChild(bloc, parentIndex, index, isLoading);
      },
    );
  }

  _buildModelChild(
      AddProductBloc bloc, int parentIndex, int index, bool isLoading) {
    return InkWell(
      onLongPress: () {
        if (bloc.productsById[parentIndex].children?[index] != null) {
          bloc.add(
            SaveLocalToCartEvent(
              product: bloc.productsById[parentIndex].children![index],
            ),
          );
        }
      },
      child: Text(
        bloc.productsById[parentIndex].children?[index].name ?? "",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
