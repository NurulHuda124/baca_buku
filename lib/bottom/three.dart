import 'package:flutter/material.dart';

class Three extends StatelessWidget {
  const Three({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 50.0, right: 50.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8),
              ),
              FloatingActionButton(
                backgroundColor: Colors.purple,
                onPressed: () {},
                tooltip: 'Tambahkan Sampul',
                child: const Icon(Icons.add_a_photo),
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
                padding: EdgeInsets.only(bottom: 50),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    onPressed: () {
                      Navigator.pushNamed(context, '/tulisku');
                    },
                    color: Colors.purple,
                    child: const Text('Unggah',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
