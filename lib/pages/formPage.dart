// ignore_for_file: file_names

import 'package:baca_buku_flutter/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key, this.id, required this.email}) : super(key: key);

  final String? id;
  final String email;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  var gambarController = TextEditingController();
  var judulController = TextEditingController();
  var penulisController = TextEditingController();
  var jenisController = TextEditingController();
  var sinopsisController = TextEditingController();
  var halamanController = TextEditingController();

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference? books;

  void getData() async {
    books = firebase.collection('books');
    if (widget.id != null) {
      var data = await books!.doc(widget.id).get();
      var item = data.data() as Map<String, dynamic>;
      setState(() {
        gambarController = TextEditingController(text: item['gambar']);
        judulController = TextEditingController(text: item['judul']);
        penulisController = TextEditingController(text: item['penulis']);
        jenisController = TextEditingController(text: item['jenis']);
        sinopsisController = TextEditingController(text: item['sinopsis']);
        halamanController = TextEditingController(text: item['halaman']);
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Unggah',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          actions: [
            widget.id != null
                ? IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              title: const Text('Konfirmasi'),
                              content: const Text(
                                  'Apakah kamu yakin ingin menghapus ini?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      books!.doc(widget.id).delete();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage(
                                                  email: widget.email,
                                                )),
                                      );
                                    },
                                    child: const Text('Iya')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Tidak'))
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ))
                : const SizedBox()
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(padding: const EdgeInsets.all(16.0), children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Silahkan isi untuk merekomendasikan bukumu!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: gambarController,
              decoration: InputDecoration(
                labelText: "Link Gambar",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Link Gambar harus diisi!';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: judulController,
              decoration: InputDecoration(
                labelText: "Judul Buku",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Judul Buku harus diisi!';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: penulisController,
              decoration: InputDecoration(
                labelText: "Penulis",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Penulis harus diisi!';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: jenisController,
              decoration: InputDecoration(
                labelText: "Jenis Buku",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Jenis Buku harus diisi!';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: halamanController,
              decoration: InputDecoration(
                labelText: "Jumlah Halaman",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Jumlah Halaman iharus diisi!';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: sinopsisController,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Sinopsis",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Sinopsis harus diisi!';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Unggah",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.id == null) {
                    books!.add({
                      'gambar': gambarController.text,
                      'judul': judulController.text,
                      'penulis': penulisController.text,
                      'jenis': jenisController.text,
                      'halaman': halamanController.text,
                      'sinopsis': sinopsisController.text,
                      'email': widget.email
                    });
                  } else {
                    books!.doc(widget.id).update({
                      'gambar': gambarController.text,
                      'judul': judulController.text,
                      'penulis': penulisController.text,
                      'jenis': jenisController.text,
                      'halaman': halamanController.text,
                      'sinopsis': sinopsisController.text,
                      'email': widget.email
                    });
                  }
                  const snackBar = SnackBar(
                    content: Text('Buku berhasil diunggah!',
                        style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.amber,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                email: widget.email,
                              )));
                }
              },
            )
          ]),
        ));
  }
}
