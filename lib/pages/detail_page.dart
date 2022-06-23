// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_const

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
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('books')
            .where('judul', isEqualTo: widget.judul)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // ignore: prefer_is_empty
            return snapshot.data!.docs.length != 0
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                                          snapshot.data!.docs[index]['gambar'],
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
                                        snapshot.data!.docs[index]['judul'],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]['jenis'],
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
                                            snapshot.data!.docs[index]
                                                ['penulis'],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['halaman'],
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const Text(
                                            ' halaman',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Diunggah : ',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['email'],
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Material(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color: Colors.deepPurple,
                                            shadowColor: Colors.black,
                                            elevation: 5.0,
                                            child: MaterialButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Comments(
                                                                  email: widget
                                                                      .email,
                                                                  id: widget
                                                                      .id)));
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
                                          CircleAvatar(
                                            maxRadius: 23,
                                            backgroundColor: Colors.amber,
                                            child: IconButton(
                                                onPressed: () async {
                                                  FirebaseFirestore firestore =
                                                      FirebaseFirestore
                                                          .instance;
                                                  CollectionReference favorite =
                                                      firestore.collection(
                                                          "favorite");

                                                  await favorite.add({
                                                    'emailUsr': widget.email,
                                                    'id': widget.id,
                                                    'judul': snapshot.data!
                                                        .docs[index]['judul'],
                                                    'gambar': snapshot.data!
                                                        .docs[index]['gambar'],
                                                    'penulis': snapshot.data!
                                                        .docs[index]['penulis'],
                                                  });
                                                  const snackBar = SnackBar(
                                                    content: Text(
                                                        'Berhasil disimpan sebagai favorite!',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)),
                                                    backgroundColor:
                                                        Colors.amber,
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                                icon: const Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.black,
                                                )),
                                          )
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
                                          snapshot.data!.docs[index]
                                              ['sinopsis'],
                                          style: const TextStyle(
                                              fontSize: 13, height: 1.5),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : const Center(
                    child: Text(
                      'Tidak Ada Komentar',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
          } else {
            return const Center(child: Text("Loading...."));
          }
        },
      ),
    );
  }
}
