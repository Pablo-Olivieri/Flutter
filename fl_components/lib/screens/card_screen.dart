import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget '),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
              name: 'Un hermoso paisaje',
              imageUrl:
                  'https://avivamientochaco.com/web/wp-content/uploads/2018/10/travel-landscape-01.jpg',
            ),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://www.solofondos.com/wp-content/uploads/2016/04/mountain-landscape-wallpaper.jpg',
            ),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  'https://media-exp1.licdn.com/dms/image/C4D1BAQFsdjpzrtQWUA/company-background_10000/0/1519796755846?e=2159024400&v=beta&t=tL2HSXGgliQAAqXK0ZvfDvXvdRD2j3Gpk_juoBRmYlM',
            ),
            SizedBox(height: 100), //se le dio mas para que se note el Scroll
          ],
        ));
  }
}
