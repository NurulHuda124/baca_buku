// ignore_for_file: file_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class addComent extends StatefulWidget {
  const addComent(
      {Key? key, required this.id, required this.email, required this.judul})
      : super(key: key);

  final String id;
  final String email;
  final String judul;

  @override
  State<addComent> createState() => _addComentState();
}

// ignore: camel_case_types
class _addComentState extends State<addComent> {
  final _formKey = GlobalKey<FormState>();

  var komentarController = TextEditingController();
  Future<void> simpan() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference coments = firestore.collection("coments");

    await coments.add({
      'emailUsr': widget.email,
      'judul': widget.id,
      "komentar": komentarController.text,
    });
    // ignore: avoid_print
    print("Data Tersimpan");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tambah Komentar',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
        ),
        body: Form(
          key: _formKey,
          child: ListView(padding: const EdgeInsets.all(16.0), children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Silahkan Masukkan Komentar Anda Disini!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: komentarController,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Tulis Komentar",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Komentar Harus Diisi!';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => simpan(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.deepPurple,
                ),
                height: 50,
                width: 150,
                child: const Center(
                  child: Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
