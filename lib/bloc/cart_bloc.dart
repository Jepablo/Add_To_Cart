
import 'dart:async';

import 'package:add_to_cart/data/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Event/cart_event.dart';
import '../state/cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState> {
  CartBloc() : super(CartInitial()) {
    //events
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }


  FutureOr<void> cartInitialEvent(CartInitialEvent event,
      Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    //need to get cart item first
    // check whether the grocery model inside the cartItems (which going to be true) (this and above is shown in cart_event cart_tile_widget

    cartItems.remove(event.groceryDataModel); // this is from cart_event
    //run a function to delete the product from cartItems
    //emit cartItemRemovedState
    emit(CartSuccessState(cartItems: cartItems)); //will refresh the UI and item of choice will be remove
    //create another emit state to show message or make the app loading for 1 seconds;



  }
}
  

