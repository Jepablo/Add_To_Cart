import 'dart:async';

import 'package:add_to_cart/data/grocery_data.dart';
import 'package:add_to_cart/data/liked_item.dart';
import 'package:add_to_cart/model/grocery_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:add_to_cart/Event/grocery_event.dart';
import 'package:add_to_cart/state/grocery_state.dart';

import '../data/cart_item.dart';

class GroceryBloc extends Bloc<GroceryEvent,GroceryHomeState> {
  GroceryBloc() : super(GroceryInitial()) {
    //events
    on<GroceryInitialEvent>(groceryInitialEvent); //first even when app is running , function
    on<AddtoCartButtonEvent>(addtoCartButtonEvent); //function
    on<LikeCartButtonEvent>(likeCartButtonEvent); //function
    on<AddtoCartNavigateEvent>(addtoCartNavigateEvent); //function
    on<LikeCartNavigateEvent>(likeCartNavigateEvent); //function
    // on<RemoveButtonGroceryEvent>(removeButtonGroceryEvent); // function

  }

  FutureOr<void> groceryInitialEvent(
      GroceryInitialEvent event, Emitter<GroceryHomeState> emit) async{
    emit(GroceryLoadingState()); //loading state when app is running first time
    await Future.delayed(Duration(seconds: 3));
    // retrieve data from grocery_data
    emit(GroceryLoadedSuccessState(grocery: GroceryData.groceryproducts.map((e) => GroceryDataModel( // e stands for each of the data
        id: e['id'],
        name: e['name'],
        desc: e['desc'],
        price: e['price']
    )).toList()
    ));
  }

  FutureOr<void> addtoCartButtonEvent(AddtoCartButtonEvent event,
      Emitter<GroceryHomeState> emit) {
        print('add product to cart click');
        cartItems.add(event.clickproduct);
        emit(GroceryAddToCartActionState());
      }
  FutureOr<void> likeCartButtonEvent(LikeCartButtonEvent event,Emitter<GroceryHomeState> emit) {
        print('like product to cart click');
        likedItems.add(event.clickproduct);
        emit(GroceryLikeCartActionState());

  }

  FutureOr<void> addtoCartNavigateEvent(AddtoCartNavigateEvent event, Emitter<GroceryHomeState> emit) {

    print('add product to cart click');
    emit(GroceryNavigatetoCartPageState());
  }

  FutureOr<void> likeCartNavigateEvent(LikeCartNavigateEvent event, Emitter<GroceryHomeState> emit) {
    print('like product to cart click');
    emit(GroceryNavigatetoLikeCartPageState());
  }



  // FutureOr<void> removeButtonGroceryEvent(RemoveButtonGroceryEvent event, Emitter<GroceryHomeState> emit) {
  //
  //   GroceryData.groceryList.remove(event.groceryDataModel);
  //   emit(GroceryLoadedSuccessState(grocery: GroceryData.groceryList));
  // }
}