import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritku', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: NetworkImage('assets/images/Teluk_Alaska.jpg'),
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/antares2.jfif'),
                  width: 140,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/abighea.jfif'),
                  width: 145,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
