import 'package:add_to_cart/model/grocery_model.dart';
import 'package:add_to_cart/page/grocery_tile_widget.dart';
import 'package:add_to_cart/page/like.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Event/grocery_event.dart';
import '../bloc/grocery_bloc.dart';
import '../state/grocery_state.dart';
import 'cart.dart';

class GroceryPage extends StatefulWidget {
  const GroceryPage({Key? key}) : super(key: key);


  @override
  State<GroceryPage> createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  @override
  void initState() {
    //adding initial event
    groceryBloc.add(GroceryInitialEvent());
    super.initState();
  }
  //initialize the instance
  final GroceryBloc groceryBloc = GroceryBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroceryBloc,GroceryHomeState>(
      bloc: groceryBloc,
      listenWhen: (previous, current) => current is GroceryActionHomeState,// takes previous and current state which need to return bool to determine if the listener function needs to be invoked
      buildWhen: (previous, current) => current is! GroceryActionHomeState,//to determine whether or not // to rebuild the widget with state, if omit, by default its true

      //initialize bloc
      listener: (context,state){
        //implement listener
        if (state is GroceryNavigatetoCartPageState){
          Navigator.push(context,MaterialPageRoute(builder: (context) => CartPage()));
        }
        else if (state is GroceryNavigatetoLikeCartPageState){
          Navigator.push(context,MaterialPageRoute(builder: (context) => LikedPage()));
        }
        else if (state is GroceryLikeCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Insert into wishlist')));
        }
        else if (state is GroceryAddToCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Insert into cart')));
        }
      },
      builder: (context,state) {
        switch(state.runtimeType){
          case GroceryLoadingState: //when app just started
            return Scaffold(
              body: Center(child: CircularProgressIndicator(),));

          case GroceryLoadedSuccessState: //when loading is success
          final successState = state as GroceryLoadedSuccessState; //hold list value of grocery data
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){
                    groceryBloc.add(AddtoCartNavigateEvent());
                  }, icon: Icon(Icons.shopping_cart)),
                  IconButton(onPressed: (){
                    groceryBloc.add(LikeCartNavigateEvent());
                  }, icon: Icon(Icons.heart_broken_sharp))
                ],
                title: (Text('First Time Build Using Bloc LMAO')),
              ),
              body: ListView.builder(
                  itemCount: successState.grocery.length ,
                  itemBuilder: (context,index){
                    print(successState.grocery.length);
                return GroceryTileWidget(
                  groceryBloc: groceryBloc,
                  grocerydataModel: successState.grocery[index],);

              }),
            );

          case GroceryErrorState:
            return Scaffold(body: Center(child: Text('Error')),);

          default:
            return SizedBox();
        }
      },
    );
  }
}
