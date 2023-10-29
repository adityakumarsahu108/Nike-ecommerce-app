import 'package:flutter/material.dart';
import 'package:flutter_application_nike_app/models/cart.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/shoe.dart';

class CustomSearchDelegate extends SearchDelegate {
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
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Shoe> matchQuery = [];
    for (var mama in shoeShop) {
      matchQuery.add(mama);
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        // ignore: unused_local_variable
        var result = matchQuery[index];
        return const ListTile(
          title: Text(''),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Shoe> matchQuery = [];
    for (var mama in shoeShop) {
      matchQuery.add(mama);
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        // ignore: unused_local_variable
        var result = matchQuery[index];
        return const ListTile(
          title: Text(''),
        );
      },
    );
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    //alert to user
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added!"),
        content: Text("check your cart"),
      ),
    );
    const AlertDialog(
      icon: Icon(Icons.check_box),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: GestureDetector(
              onTap: () => CustomSearchDelegate(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    // Icons.search,
                    // color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          //message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),

          //hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks for You',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          //list of shoes for sale
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                //get a shoe

                Shoe shoe = value.getShoeList()[index];
                //return the shoe
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
