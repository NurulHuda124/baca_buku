// ignore_for_file: deprecated_member_use, unnecessary_const

import 'package:baca_buku_flutter/auth/login_page.dart';
import 'package:baca_buku_flutter/models/sign_in.dart';
import 'package:baca_buku_flutter/pages/favoritePage.dart';
import 'package:baca_buku_flutter/pages/formPage.dart';
import 'package:baca_buku_flutter/pages/home.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  AccountScreen({required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  children: const [
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                        size: 60,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Selamat Datang',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            email,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 530,
            height: 398,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: const Radius.circular(25))),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FavoritePage(email: email)),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Favorite',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
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
                    // side: const BorderSide(width: 2),
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
                        child: const Text(
                          'Logout',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black87),
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
        ],
      ),
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
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
                            builder: (context) => FavoritePage(email: email)),
                      );
                    },
                    icon: const Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: Colors.deepPurple,
                    )),
                const Text(
                  'Favorite',
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
                            builder: (context) => FormPage(
                                  email: email,
                                )),
                      );
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      size: 30,
                      color: Colors.deepPurple,
                    )),
                const Text(
                  'Unggah',
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
