import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviders extends StatefulWidget {
  const MultiProviders({super.key});

  @override
  State<MultiProviders> createState() => _MultiProvidersState();
}

class _MultiProvidersState extends State<MultiProviders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiProviders"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProvOne()),
          ChangeNotifierProvider(
            create: (context) => ProvTwo(),
          )
        ],
        child: Column(
          children: [
            Consumer<ProvOne>(
              builder: (context, value, child) =>
                  Center(child: Text("${value.name}")),
            ),
            Consumer<ProvOne>(
              builder: (context, value, child) => MaterialButton(
                onPressed: () {
                  value.changeName();
                },
                child: Text("Change"),
              ),
            ),
            Consumer<ProvTwo>(
              builder: (context, value, child) => Center(
                child: Text("${value.num}"),
              ),
            ),
            Consumer<ProvTwo>(
              builder: (context, value, child) => Center(
                child: MaterialButton(
                  onPressed: () => value.addition(),
                  child: Text("Add"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProvOne with ChangeNotifier {
  String name = "basel";

  changeName() {
    name = "mohamed";
    notifyListeners();
  }
}

class ProvTwo with ChangeNotifier {
  int num = 1;

  addition() {
    num++;
    notifyListeners();
  }
}
