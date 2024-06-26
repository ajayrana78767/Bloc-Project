import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all()),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(productDataModel.imageUrl),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) => '',
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productDataModel.price.toString()}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ));
                      },
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.black)),
                  IconButton(
                      onPressed: () {
                         homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel
                         ));
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
