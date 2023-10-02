
import 'package:add_to_cart/model/grocery_model.dart';

abstract class CartEvent{}

class CartInitialEvent extends CartEvent{

} //initial

class CartRemoveFromCartEvent extends CartEvent{
  final GroceryDataModel groceryDataModel;
  CartRemoveFromCartEvent({required this.groceryDataModel});
}