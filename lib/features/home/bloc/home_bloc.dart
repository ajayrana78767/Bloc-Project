// // ignore_for_file: avoid_print

// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:bloc_project/data/grocery_data.dart';
// import 'package:meta/meta.dart';

// import '../models/home_product_data_model.dart';

// part 'home_event.dart';
// part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitial()) {
//     on<HomeInitialEvent>(homeInitialEvent);
//     on<HomeProductWithlistButtonClickedEvent>(
//         homeProductWithlistButtonClickedEvent);
//     on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
//     on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
//     on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
//   }
//   FutureOr<void> homeInitialEvent(
//       HomeInitialEvent event, Emitter<HomeState> emit) async {
//     emit(HomeLoadingState());
//     await Future.delayed(const Duration(seconds: 3));
//     emit(HomeLoadedSuccessState(
//         products: GroceryData.groceryItems
//             .map(
//               (e) => ProductDataModel(
//                 id: e['id'],
//                 name: e['name'],
//                 description: e['description'],
//                 price: e['price'],
//                 imageUrl: e['imageUrl'],
//               ),
//             )
//             .toList()));
//   }

//   FutureOr<void> homeProductWithlistButtonClickedEvent(
//       HomeProductWithlistButtonClickedEvent event, Emitter<HomeState> emit) {
//     print('Wishlist Product Clicked');
//   }

//   FutureOr<void> homeProductCartButtonClickedEvent(
//       HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
//     print('Cart Product Clicked');
//   }

//   FutureOr<void> homeWishlistButtonNavigateEvent(
//       HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
//     print('Wishlist Navigate Clicked');
//     emit(HomeNavigateToWishlistPageActionState());
//   }

//   FutureOr<void> homeCartButtonNavigateEvent(
//       HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
//     print('Cart Navigate Clicked');
//     emit(HomeNavigateToCartPageActionState());
//   }
// }
// lib/features/home/bloc/home_bloc.dart

// ignore_for_file: avoid_print

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_items.dart';
import 'package:bloc_project/data/grocery_data.dart';
import 'package:bloc_project/data/wishlist_items.dart';
import 'package:meta/meta.dart';
import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
      products: GroceryData.groceryItems
          .map((e) => ProductDataModel(
                id: e['id'] ?? '',
                name: e['name'] ?? '',
                description: e['description'] ?? '',
                price: e['price'] ?? '',
                imageUrl: e['imageUrl'] ?? '',
              ))
          .toList(),
    ));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {

    print('Wishlist Product Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  Future<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) async {
    print('Cart Product Clicked');
     cartItems.add(event.clickedProduct);
     emit(HomeProductItemCartedActionState());
  }

  Future<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) async {
    print('Wishlist Navigate Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  Future<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) async {
    print('Cart Navigate Clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
