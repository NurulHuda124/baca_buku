import 'package:flutter/material.dart';
import 'item_list.dart';
import 'entry_form.dart';

import '../database/db_helper.dart';
import '../models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => EntryForm(
                Item('', '', ''),
                true,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Perpustakaan'),
      ),
      body: FutureBuilder(
        future: db.getItem(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          var data = snapshot.data;

          return snapshot.hasData
              ? ItemList(data as List<Item>)
              : const Center(
                  child: Text('Tidak Ada Data'),
                );
        },
      ),
    );
  }
}
