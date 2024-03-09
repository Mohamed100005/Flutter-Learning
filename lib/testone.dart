import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/widgetchild.dart';

class TestOne extends StatefulWidget {
  const TestOne({super.key});

  @override
  State<TestOne> createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model1(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Providers"),
            ),
            body: WidgetChild()));
  }
}
