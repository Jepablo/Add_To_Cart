
import '../model/grocery_model.dart';

abstract class LikeState {}

abstract class LikeActionState extends LikeState {}

class LikeInitial extends LikeState {}

class LikeSuccessState extends LikeState{
  final List<GroceryDataModel> likeItems;
      LikeSuccessState({required this.likeItems});
}

class LikeErrorState extends LikeState {}