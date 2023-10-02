import 'package:add_to_cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Event/cart_event.dart';
import '../state/cart_state.dart';
import 'cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    //adding initial event
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),),
      body: BlocConsumer<CartBloc,CartState>( // <Bloc,State>
        bloc: cartBloc,
        listener: (context,state){},
          listenWhen: (previous,current) => current is CartActionState,
          buildWhen: (previous,current) => current is! CartActionState,
        builder: (context,state) {
          switch (state.runtimeType){
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length ,
                  itemBuilder: (context,index){
                    print(successState.cartItems.length);
                    return CartTileWidget(
                      cartBloc: cartBloc,
                      grocerydataModel: successState.cartItems[index],);

                  });
          }
          return Container();
        }
      ),
    );
  }
}
