import 'package:add_to_cart/Event/cart_event.dart';
import 'package:add_to_cart/Event/grocery_event.dart';
import 'package:add_to_cart/bloc/cart_bloc.dart';
import 'package:add_to_cart/bloc/grocery_bloc.dart';
import 'package:flutter/material.dart';
import '../model/grocery_model.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({Key? key, required this.grocerydataModel, required this.cartBloc}) : super(key: key);
  final GroceryDataModel grocerydataModel;
  final CartBloc cartBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // TextButton(onPressed: (){
          //   print(grocerydataModel.id);
          // }, child: Text('Click')),
          Text(grocerydataModel.id),
          Text(grocerydataModel.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(grocerydataModel.desc),
          Text(grocerydataModel.price.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IconButton(onPressed: (){
              //   // groceryBloc.add(AddtoCartNavigateEvent());
              //   // groceryBloc.add(AddtoCartButtonEvent(clickproduct: grocerydataModel )); //pass data to cart page
              // }, icon: Icon(Icons.shopping_cart), color: Colors.green,),
              IconButton(onPressed: (){
                // groceryBloc.add(LikeCartButtonEvent(clickproduct: grocerydataModel)); // pass data to liked page
                // groceryBloc.add(LikeCartNavigateEvent());
                cartBloc.add(CartRemoveFromCartEvent(groceryDataModel: grocerydataModel));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Removed')));

              }, icon: Icon(Icons.delete,color: Colors.blue,))
            ],
          )

        ],

      ),
    );
  }
}
