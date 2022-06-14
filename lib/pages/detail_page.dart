// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:baca_buku_flutter/pages/comments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {Key? key, required this.email, required this.id, required this.judul})
      : super(key: key);
  final String id;
  final String email;
  final String judul;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference? books;

  var gambar, judul, penulis, jenis, sinopsis, halaman;
  void getData() async {
    //get users collection from firebase
    //collection is table in mysql
    books = firebase.collection('books');

    //if have id
    // ignore: unnecessary_null_comparison
    if (widget.id != null) {
      //get users data based on id document
      var data = await books!.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
      setState(() {
        gambar = item['gambar'];
        judul = item['judul'];
        penulis = item['penulis'];
        jenis = item['jenis'];
        sinopsis = item['sinopsis'];
        halaman = item['halaman'];
      });
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.favorite,
        //       color: Colors.pink,
        //     ),
        //   )
        // ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Material(
                        elevation: 15.0,
                        shadowColor: Colors.blue.shade900,
                        child: Image.network(
                          '$gambar',
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$judul',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$jenis',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          const Text('|'),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          Text(
                            '$penulis',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$halaman halaman',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                          // const Text(
                          //   ' halaman',
                          //   style: TextStyle(
                          //     color: Colors.black54,
                          //     fontSize: 15,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.deepPurple,
                            shadowColor: Colors.black,
                            elevation: 5.0,
                            child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Comments(
                                              email: widget.email,
                                              id: widget.id)));
                                },
                                minWidth: 140,
                                child: const Text(
                                  'Lihat Komentar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
                  Container(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '$sinopsis',
                          style: const TextStyle(fontSize: 13, height: 1.5),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
