import 'package:flutter/material.dart';

class Akun extends StatelessWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 50.0, right: 50.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/1.png'),
            radius: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Bismilah',
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'bismilah123@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/favorit');
                },
                color: Colors.white,
                child: const Text('Buku Favorit',
                    style: TextStyle(color: Colors.black)),
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/bookmark');
                },
                color: Colors.white,
                child: const Text('Bookmark',
                    style: TextStyle(color: Colors.black)),
              ),
              Material(
                borderRadius: BorderRadius.circular(50.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/tulisku');
                  },
                  color: Colors.white,
                  child: const Text('Tulisanku',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                color: Colors.white,
                child:
                    const Text('Keluar', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
