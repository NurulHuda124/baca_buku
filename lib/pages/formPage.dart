// ignore_for_file: file_names

import 'package:baca_buku_flutter/pages/home1.dart';
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
  //set form key
  final _formKey = GlobalKey<FormState>();

  //set texteditingcontroller variable
  var gambarController = TextEditingController();
  var judulController = TextEditingController();
  var penulisController = TextEditingController();
  var jenisController = TextEditingController();
  var sinopsisController = TextEditingController();
  var halamanController = TextEditingController();

  //inisialize firebase instance
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference? books;

  void getData() async {
    //get users collection from firebase
    //collection is table in mysql
    books = firebase.collection('books');

    //if have id
    if (widget.id != null) {
      //get users data based on id document
      var data = await books!.doc(widget.id).get();

      //we get data.data()
      //so that it can be accessed, we make as a map
      var item = data.data() as Map<String, dynamic>;

      //set state to fill data controller from data firebase
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
            //if have data show delete button
            widget.id != null
                ? IconButton(
                    onPressed: () {
                      //method to delete data based on id
                      books!.doc(widget.id).delete();

                      //back to main page
                      // '/' is home
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/one', (Route<dynamic> route) => false);
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ))
                : const SizedBox()
          ],
        ),
        //this form for add and edit data
        //if have id passed from main, field will show data
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
                  //if id not null run add data to store data into firebase
                  //else update data based on id
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
                  //snackbar notification
                  const snackBar = SnackBar(
                    content: Text('Buku berhasil diunggah!',
                        style: TextStyle(color: Colors.black)),
                    backgroundColor: Colors.amber,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  //back to main page
                  //home page => '/'
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
