import 'package:baca_buku_flutter/pages/addComent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key, required this.email, required this.id})
      : super(key: key);
  final String email;
  final String id;

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  var komentarController = TextEditingController();
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  final CollectionReference coments =
      FirebaseFirestore.instance.collection('coments');

  hapusData() async {
    coments.doc(widget.id).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Data Terhapus"),
      backgroundColor: Colors.deepPurple,
    ));
    // ignore: avoid_print
    print("Data Terhapus");
    Navigator.pop(context);
  }

  // void getData() async {
  //   coments = firebase.collection('coments');
  //   // ignore: unnecessary_null_comparison
  //   if (widget.id != null) {
  //     var data = await coments!.doc(widget.id).get();
  //     // ignore: unused_local_variable
  //     var item = data.data() as Map<String, dynamic>;

  //     //set state to fill data controller from data firebase
  //     setState(() {
  //       komentarController = TextEditingController(text: item['komentar']);
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   // ignore: todo
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Komentar',
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
          // ignore: unnecessary_null_comparison
          widget.id != null
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addComent(
                                email: widget.email,
                                id: widget.id,
                                judul: widget.id,
                              )),
                    );
                  },
                  icon: const Icon(
                    Icons.add_comment,
                    size: 30,
                  ))
              : const SizedBox()
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        //data to be retrieved in the future
        stream: FirebaseFirestore.instance
            .collection('coments')
            .where('judul', isEqualTo: widget.id)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          title: Text(
                            snapshot.data!.docs[index]['emailUsr'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docs[index]['komentar'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          // trailing: IconButton(
                          //   onPressed: () {
                          //     coments.doc(widget.id).delete();
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(
                          //       content: Text("Data Terhapus"),
                          //       backgroundColor: Colors.deepPurple,
                          //     ));
                          //     // ignore: avoid_print
                          //     print("Data Terhapus");
                          //     Navigator.pop(context);
                          //   },
                          //   icon: const Icon(
                          //     Icons.delete,
                          //     size: 30,
                          //     color: Colors.deepPurple,
                          //   ),
                          // ),
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
