import 'package:flutter/material.dart';

class Tulisku extends StatelessWidget {
  const Tulisku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tulisanku', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Text('Belum ada karya'),
        ],
      ),
    );
  }
}
