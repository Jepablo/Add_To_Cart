
import 'package:add_to_cart/data/grocery_data.dart';
import 'package:add_to_cart/model/grocery_model.dart';

abstract class GroceryEvent {}

class GroceryInitialEvent extends GroceryEvent{}

class AddtoCartButtonEvent extends GroceryEvent{
  final GroceryDataModel clickproduct;

  AddtoCartButtonEvent({required this.clickproduct});
}

class LikeCartButtonEvent extends GroceryEvent{
  final GroceryDataModel clickproduct;

  LikeCartButtonEvent({required this.clickproduct});
}

// class RemoveButtonGroceryEvent extends GroceryInitialEvent{
//   // to remove
//   final GroceryDataModel groceryDataModel;
//   RemoveButtonGroceryEvent({required this.groceryDataModel});
//
// }

class LikeCartNavigateEvent extends GroceryEvent{

}

class AddtoCartNavigateEvent extends GroceryEvent{

}