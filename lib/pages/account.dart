import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const Image(
            image: NetworkImage('assets/images/poto_propil.png'),
            width: 500,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Text('Irfan Zidni'),
            Text('@irfanzdn'),
          ])
        ]),
      ),
    );
  }
}
