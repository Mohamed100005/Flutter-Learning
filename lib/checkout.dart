import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: model.basketItem.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(model.basketItem[index].name),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  model.remove(model.basketItem[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
