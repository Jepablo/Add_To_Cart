
import '../model/grocery_model.dart';

abstract class GroceryHomeState {}

abstract class GroceryActionHomeState extends GroceryHomeState{} // for button cart&liked to navigate to other page

class GroceryInitial extends GroceryHomeState{} //initial

class GroceryLoadingState extends GroceryHomeState{} // to give a delay loading while UI building

class GroceryLoadedSuccessState extends GroceryHomeState{
  final List<GroceryDataModel> grocery;
  GroceryLoadedSuccessState({required this.grocery});
} // when data already retrieved and success

class GroceryErrorState extends GroceryHomeState{} // when error happen

//action state
class GroceryNavigatetoLikeCartPageState extends GroceryActionHomeState{} //this when user clicked the heart button to navigate to cart page

//action state
class GroceryNavigatetoCartPageState extends GroceryActionHomeState{} //this when user clicked the cart button to navigate to cart page

//action state
class GroceryLikeCartActionState extends GroceryActionHomeState{} // this is when user clicked the liked button and will show message

//action state
class GroceryAddToCartActionState extends GroceryActionHomeState{} // this is when user clicked the cart button and will show message