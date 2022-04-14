import 'package:flutter/material.dart';
import 'package:baca_buku_flutter/models/item.dart';
import 'package:baca_buku_flutter/widget/card.dart';

class ListViews extends StatelessWidget {
  const ListViews({Key? key, required this.page, required this.items})
      : super(key: key);
  final List<Item> items;
  final String page;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, page, arguments: item);
          },
          child: TheCard(
              imageUrl: item.imageUrl,
              judul: item.judul,
              author: item.author,
              text: item.text),
        );
      },
    );
  }
}
