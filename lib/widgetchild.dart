import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetChild extends StatelessWidget {
  const WidgetChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("${context.watch<Model1>().name}")),
        MaterialButton(
          color: Colors.indigoAccent,
          onPressed: () {
            context.read<Model1>().change1();
          },
          child: Text("Do Something"),
        )
      ],
    );
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";

  changeName() {
    name = "Wael";
    notifyListeners();
  }
}

class Model1 extends ChangeNotifier {
  String name = "Wael";

  change1() {
    name = "mo";
    notifyListeners();
  }
}
