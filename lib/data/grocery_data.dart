import '../model/grocery_model.dart';

class GroceryData{

  static List<Map<String,dynamic>> groceryproducts =[
    {
      'id': '1',
      'name' : 'Mango',
      'desc' : 'This is Mango',
      'price' : 12.9,
    },
    {
      'id': '2',
      'name' : 'Apple',
      'desc' : 'This is Apple',
      'price' : 11.9,
    },
    {
      'id': '3',
      'name' : 'Grape',
      'desc' : 'This is Grape',
      'price' : 14.9,
    },
    {
      'id': '4',
      'name' : 'Durian',
      'desc' : 'This is Durian',
      'price' : 42.9,
    },
    {
      'id': '5',
      'name' : 'Pineapple',
      'desc' : 'This is Pineapple',
      'price' : 62.9,
    }
  ];

  // static List<GroceryDataModel> groceryList = groceryproducts.map((map) {
  //   return GroceryDataModel(
  //     id: map['id'],
  //     price: map['price'],
  //     name: map['name'],
  //     desc: map['desc']
  //   );
  // }).toList();
}