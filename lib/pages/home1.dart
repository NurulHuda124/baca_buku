import 'package:baca_buku_flutter/pages/akun.dart';
import 'package:baca_buku_flutter/pages/comments.dart';
import 'package:baca_buku_flutter/pages/detail_page.dart';
import 'package:baca_buku_flutter/pages/formPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    // ignore: unused_local_variable
    CollectionReference books = firebase.collection('books');

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'Baca',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            Text(
              'Buku',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black38,
      ),
      body: FutureBuilder<QuerySnapshot>(
        //data to be retrieved in the future
        future: books.get(),
        builder: (context, snapshot) {
          //show if there is data
          if (snapshot.hasData) {
            // ignore: prefer_is_empty
            return snapshot.data!.docs.length != 0
                ? ListView.builder(
                    // displayed as much as the variable data alldata
                    itemCount: snapshot.data!.docs.length,

                    //make custom item with list tile.
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        elevation: 2.0,
                        child: ListTile(
                          leading: SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              id: snapshot.data!.docs[index].id,
                                              email: widget.email,
                                              judul: snapshot.data!.docs[index]
                                                  ['judul'],
                                            )));
                              },
                              child: Image.network(
                                  snapshot.data!.docs[index]['gambar']),
                            ),
                          ),
                          title: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormPage(
                                            id: snapshot.data!.docs[index].id,
                                            email: widget.email,
                                          )));
                            },
                            child: Text(
                              snapshot.data!.docs[index]['judul'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Text(snapshot.data!.docs[index]['penulis'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                //pass data to edit form
                                MaterialPageRoute(
                                    builder: (context) => Comments(
                                          id: snapshot.data!.docs[index].id,
                                          email: widget.email,
                                        )),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: Text(
                      'Tidak Ada Data',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
          } else {
            return const Center(child: Text("Loading...."));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormPage(
                      email: widget.email,
                    )),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomSheet: const SizedBox(
        height: 20,
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  email: widget.email,
                                )),
                      );
                    },
                    icon: const Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: Colors.deepPurple,
                    )),
                const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountScreen(
                                  email: widget.email,
                                )),
                      );
                    },
                    icon: const Icon(
                      Icons.person_outline,
                      size: 30,
                      color: Colors.deepPurple,
                    )),
                const Text(
                  'Profil',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
