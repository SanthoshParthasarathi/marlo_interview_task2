import 'package:flutter/material.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoanScreen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Loans Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
