import 'package:flutter/material.dart';

class Coment extends StatelessWidget {
  const Coment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komentar', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tulis komentar di sini..',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
