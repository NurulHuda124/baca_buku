import 'package:flutter/material.dart';
import 'package:baca_buku_flutter/models/item.dart';
import 'package:baca_buku_flutter/widget/list_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(
        imageUrl: "Teluk_Alaska.jpg",
        judul: 'Teluk Alaska',
        author: 'Siti',
        text:
            "LLorem ipsum dolor sit amet consectetur adipisicing elit. Repellat iure quaerat, molestias dolore commodi sequi porro, delectus eius quos saepe recusandae veniam modi laudantium voluptatibus cumque odit similique beatae eos "),
    Item(
        imageUrl: "antares2.jfif",
        judul: 'Antares 2',
        author: 'Susi',
        text:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat iure quaerat, molestias dolore commodi sequi porro, delectus eius quos saepe recusandae veniam modi laudantium voluptatibus cumque odit similique beatae eos"),
    Item(
        imageUrl: "abighea.jfif",
        judul: 'Abi Ghea',
        author: 'Sari',
        text:
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat iure quaerat, molestias dolore commodi sequi porro, delectus eius quos saepe recusandae veniam modi laudantium voluptatibus cumque odit similique beatae eos"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perpustakaan'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListViews(
          items: items,
          page: '/item',
        ),
      ),
    );
  }
}
