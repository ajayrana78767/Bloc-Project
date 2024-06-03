// import 'package:bloc_project/features/cart/bloc/cart_bloc.dart';
// import 'package:bloc_project/features/cart/ui/cart_tile_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Cart extends StatefulWidget {
//   const Cart({super.key});

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   final CartBloc cartBloc = CartBloc();
//   @override
//   void initState() {
//     // TODO: implement initState
//     cartBloc.add(CartInitialEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Cart Items',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal,
//       ),
//       body: BlocConsumer<CartBloc, CartState>(
//         bloc: cartBloc,
//         listenWhen: (previous, current) => current is CartActionState,
//         buildWhen: (previous, current) => current is! CartActionState,
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           switch (state.runtimeType) {
//             case CartSuccessState:
//               final successState = state is CartSuccessState;
//               return ListView.builder(
//                   itemCount: successState.cartItems.length,
//                   itemBuilder: (context, index) {
//                     return CartTileWidget(
//                       productDataModel: successState.cartItems[index],
//                       cartBloc: cartBloc,
//                     );
//                   });
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
import 'package:bloc_project/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_project/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  
  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart Items',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CartSuccessState) {
            final successState = state as CartSuccessState;
            return ListView.builder(
              itemCount: successState.cartItems.length,
              itemBuilder: (context, index) {
                return CartTileWidget(
                  productDataModel: successState.cartItems[index],
                  cartBloc: cartBloc,
                );
              }
            );
          }
          return Container();
        },
      ),
    );
  }
}
