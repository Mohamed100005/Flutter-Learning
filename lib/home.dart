import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/checkout.dart';
import 'items-list.dart';
import 'model/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Carts"),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const CheckOut();
                        },
                      ));
                    },
                    icon: const Icon(Icons.add)),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text("${cart.totalPrice}");
                    },
                  ),
                )
              ],
            )
          ],
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Card(child: Consumer<Cart>(
            builder: (context, cart, child) {
              return ListTile(
                title: Text(items[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cart.add(items[index]);
                  },
                ),
              );
            },
          )),
        ));
  }
}
