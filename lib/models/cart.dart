import 'package:flutter/widgets.dart';
import 'package:flutter_application_nike_app/models/shoe.dart';


class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom Freak',
        imagePath: 'lib/images/shoe2.png',
        price: '400',
        description: 'very nice '),
    Shoe(
        name: 'Air Folen',
        imagePath: 'lib/images/shoe3.png',
        price: '300',
        description: 'very nice '),
    Shoe(
        name: 'Campus',
        imagePath: 'lib/images/shoe4.png',
        price: '255',
        description: 'very nice '),
    Shoe(
        name: 'Addidas',
        imagePath: 'lib/images/shoe5.png',
        price: '658',
        description: 'very nice '),
    Shoe(
        name: 'Puma mama',
        imagePath: 'lib/images/shoe6.png',
        price: '268',
        description: 'very nice '),
    Shoe(
        name: 'Nike wow',
        imagePath: 'lib/images/shoe7.png',
        price: '896',
        description: 'very nice '),
    Shoe(
        name: 'Crazy',
        imagePath: 'lib/images/shoe8.png',
        price: '472',
        description: 'very nice '),
    Shoe(
        name: 'Zoom Zoom',
        imagePath: 'lib/images/shoe1.png',
        price: '800',
        description: 'very nice '),
  ];
  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
