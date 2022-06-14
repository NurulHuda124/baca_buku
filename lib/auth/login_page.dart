// ignore_for_file: deprecated_member_use

import 'package:baca_buku_flutter/auth/register_page.dart';
import 'package:baca_buku_flutter/models/sign_in.dart';
import 'package:baca_buku_flutter/models/auth.dart';
import 'package:baca_buku_flutter/pages/home1.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Baca',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      ),
                      Text(
                        'Buku',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Text(
                    'Kumpulkan Novel Rekomendasimu Di sini',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Silahkan masuk dengan mengisi email dan password',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: emailController,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: passwordController,
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: ElevatedButton(
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () async {
                    signIn(emailController.text, passwordController.text)
                        .then((result) {
                      if (result == null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      email: emailController.text,
                                    )));
                        // ignore: duplicate_ignore
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            result,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    });
                  }),
            ),
            const SizedBox(height: 20),
            Column(
              children: const <Widget>[
                Text(
                  'Atau',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(width: 20),
                Text(
                  'Masuk dengan :',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _signInButton(),
            const SizedBox(height: 70),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Tidak memiliki akun ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text(
                      'Daftar di sini',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _signInButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: InkWell(
        onTap: () {
          signInWithGoogle().then((result) {
            if (result != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage(
                      email: emailController.text,
                    );
                  },
                ),
              );
            }
          });
        },
        child: Image.asset(
          'assets/images/google.png',
          scale: 7.0,
        ),
      ),
      // ElevatedButton(
      //   onPressed: () {
      //     signInWithGoogle().then((result) {
      //       if (result != null) {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) {
      //               return HomePage(
      //                 email: emailController.text,
      //               );
      //             },
      //           ),
      //         );
      //       }
      //     });
      //   },
      //   child: const Text(
      //     "Login With Google",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //     ),
      //   ),
      //   style: ElevatedButton.styleFrom(
      //     primary: Colors.deepPurpleAccent,
      //     minimumSize: const Size(double.infinity, 50),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(40),
      //     ),
      //   ),
      // ),
    );
  }
}
