
import '../model/grocery_model.dart';

abstract class CartState{}

abstract class CartActionState extends CartState{} // for button when clicked

class CartInitial extends CartState{} // initial

class CartSuccessState extends CartState{
  final List<GroceryDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}

class CartErrorState extends CartState{}
