import 'package:flutter/material.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ContractScreen"),
        centerTitle: true,
      ),
       body: Center(
        child: Text(
          'Contract Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}