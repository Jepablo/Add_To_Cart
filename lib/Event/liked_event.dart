
import 'package:add_to_cart/model/grocery_model.dart';

abstract class LikedEvent{}

class LikedInitialEvent extends LikedEvent {} // to load up the page

class LikedRemoveEvent extends LikedEvent {
  final GroceryDataModel groceryDataModel;

  LikedRemoveEvent({required this.groceryDataModel});
} // to remove from liked pages