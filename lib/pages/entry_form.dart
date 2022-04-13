import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/item.dart';

class EntryForm extends StatefulWidget {
  final Item _item;
  final bool _isNew;

  EntryForm(this._item, this._isNew);

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  late Item item;

  final judulController = TextEditingController();
  final authorController = TextEditingController();
  final teksController = TextEditingController();

  Future insertData() async {
    var db = DBHelper();
    var item =
        Item(judulController.text, authorController.text, teksController.text);
    await db.saveItem(item);
    print('Saved');
  }

  Future updateData() async {
    var db = DBHelper();
    var item =
        Item(judulController.text, authorController.text, teksController.text);
    item.setItemId(this.item.id);
    await db.updateItem(item);
  }

  void _saveData() {
    if (widget._isNew) {
      insertData();
    } else {
      updateData();
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    if (widget._item != null) {
      item = widget._item;
      judulController.text = item.judul;
      authorController.text = item.author;
      teksController.text = item.author;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._isNew ? 'Tambah' : 'Ubah'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: judulController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Judul Buku',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: authorController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: authorController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Tulis Cerita Di Sini',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: const Text(
                        'Posting',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: _saveData,
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: const Text(
                        'Batal',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
