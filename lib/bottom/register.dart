// ignore_for_file: deprecated_member_use

import 'package:baca_buku_flutter/bottom/bottom_navi.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 100.0, right: 100.0),
          children: <Widget>[
            const Image(
              image: NetworkImage('assets/images/baku.png'),
              width: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Nama Lengkap',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            TextFormField(
              autofocus: false,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            TextFormField(
              autofocus: false,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Konfirmasi Password',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(50.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/one');
                  },
                  color: Colors.purple,
                  child: const Text('Daftar',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            FlatButton(
              child: const Text(
                'Masuk',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
      ),
      drawer: const BottomNavi(),
    );
  }
}
