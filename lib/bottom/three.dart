import 'package:flutter/material.dart';

class Three extends StatelessWidget {
  const Three({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Tambah Cerita', style: TextStyle(color: Colors.white)),
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
                labelText: 'Judul Cerita',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nama Author',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tulis Cerita',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
          ],
        ),
      ),
    );
  }
}
