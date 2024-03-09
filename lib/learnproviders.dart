import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnProvider extends StatefulWidget {
  const LearnProvider({super.key});

  @override
  State<LearnProvider> createState() => _LearnProviderState();
}

class _LearnProviderState extends State<LearnProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: ListView(
        children: <Widget>[
          Consumer<ProvOne>(
            builder: (context, value, child) {
              return const Text("somethong");
            },
          ),
          Consumer<ProvOne>(
            builder: (context, value, child) {
              return MaterialButton(
                onPressed: () {},
                child: const Text("Do Something"),
              );
            },
          )
        ],
      ),
    );
  }
}

class ProvOne extends ChangeNotifier {
  var showsomething1 = "some1";
  var showsomething2 = "some1";
  doSomeThing() {
    showsomething1 = "changed";
    notifyListeners();
  }
}

class ProvTwo extends ChangeNotifier {}

class ProvThree extends ChangeNotifier {}
