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

  //inisialize firebase instance

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
          // actions: [
          //   //if have data show delete button
          //   // ignore: unnecessary_null_comparison
          //   widget.id != null
          //       ? IconButton(
          //           onPressed: () {
          //             //method to delete data based on id
          //             FirebaseFirestore.instance
          //                 .collection("coments")
          //                 .doc(widget.id)
          //                 .delete();
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) =>
          //                       Comments(email: widget.email, id: widget.id)),
          //             );
          //           },
          //           icon: const Icon(
          //             Icons.delete,
          //             size: 30,
          //           ))
          //       : const SizedBox()
          // ],
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
              'Silahkan isi komentarmu di sini!',
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
                  return 'Komentar harus diisi!';
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

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.deepPurple,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 15),
            //     child: Text(
            //       "Unggah",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   onPressed: () {
            //     if (_formKey.currentState!.validate()) {
            //       //if id not null run add data to store data into firebase
            //       //else update data based on id
            //       // ignore: unnecessary_null_comparison
            //       // if (widget.id == null) {
            //       //   coments!.add({
            //       //     'komentar': komentarController.text,
            //       //     // 'email': widget.email,
            //       //     // 'judul': widget.judul
            //       //   });
            //       // } else {
            //       //   coments!.doc(widget.id).update({
            //       //     'komentar': komentarController.text,
            //       //     // 'email': widget.email,
            //       //     // 'judul': widget.judul
            //       //   });
            //       // }
            //       //snackbar notification
            //       const snackBar =
            //           SnackBar(content: Text('Data saved successfully!'));
            //       ScaffoldMessenger.of(context).showSnackBar(snackBar);

            //       //back to main page
            //       //home page => '/'
            //       Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) =>
            //                   Comments(email: widget.email, id: widget.id)));
            //     }
            //   },
            // )
          ]),
        ));
  }
}
