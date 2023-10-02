import 'package:add_to_cart/Event/grocery_event.dart';
import 'package:add_to_cart/bloc/grocery_bloc.dart';
import 'package:flutter/material.dart';
import '../model/grocery_model.dart';

class GroceryTileWidget extends StatelessWidget {
  const GroceryTileWidget({Key? key, required this.grocerydataModel, required this.groceryBloc}) : super(key: key);
  final GroceryDataModel grocerydataModel;
  final GroceryBloc groceryBloc;
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
              IconButton(onPressed: (){
                // groceryBloc.add(AddtoCartNavigateEvent());
                groceryBloc.add(AddtoCartButtonEvent(clickproduct: grocerydataModel )); //pass data to cart page
              }, icon: Icon(Icons.shopping_cart), color: Colors.green,),
              IconButton(onPressed: (){
                groceryBloc.add(LikeCartButtonEvent(clickproduct: grocerydataModel)); // pass data to liked page
                // groceryBloc.add(LikeCartNavigateEvent());
              }, icon: Icon(Icons.heart_broken_sharp,color: Colors.blue,)),
              // IconButton(onPressed: (){
              //   groceryBloc.add(RemoveButtonGroceryEvent(groceryDataModel: grocerydataModel)); // pass data to remove
              //   // groceryBloc.add(LikeCartNavigateEvent());
              // }, icon: Icon(Icons.delete,color: Colors.blue,))
            ],
          )

        ],

      ),
    );
  }
}
