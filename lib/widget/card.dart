import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  const TheCard(
      {Key? key,
      required this.imageUrl,
      required this.judul,
      required this.author,
      required this.text})
      : super(key: key);
  final String imageUrl;
  final String judul;
  final String author;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Image.asset("assets/images/" + imageUrl, width: 150),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            Text(
              judul,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 10),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
            ),
          ],
        ),
      ],
    );
  }
}
