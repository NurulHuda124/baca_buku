// ignore_for_file: deprecated_member_use

import 'package:baca_buku_flutter/auth/login_page.dart';
import 'package:baca_buku_flutter/models/sign_in.dart';
import 'package:baca_buku_flutter/pages/home1.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  AccountScreen({required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.person_pin,
                color: Colors.deepPurple,
                size: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      email,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(25)),
              ),
              const SizedBox(height: 40),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 2),
                ),
                elevation: 2.0,
                child: SizedBox(
                  width: 340,
                  child: ListTile(
                    leading: const Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: Colors.black87,
                    ),
                    title: OutlineButton(
                      borderSide: BorderSide.none,
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Favorite',
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 30,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 2),
                ),
                elevation: 2.0,
                child: SizedBox(
                  width: 340,
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout_outlined,
                      size: 30,
                      color: Colors.black87,
                    ),
                    title: OutlineButton(
                      borderSide: BorderSide.none,
                      onPressed: () {
                        signOutGoogle();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }), ModalRoute.withName('/'));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Logout',
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 30,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
                                  email: email,
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
                                  email: email,
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
