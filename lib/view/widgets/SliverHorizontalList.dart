import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/colors/Colors.dart';

class SliverHorizontalList extends StatefulWidget {
  const SliverHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  State<SliverHorizontalList> createState() => _SliverHorizontalListState();
}

class _SliverHorizontalListState extends State<SliverHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
      return Card(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {

              },
              color: colorGreen,
              textColor: Colors.white,
              child: Icon(FontAwesomeIcons.twitter,
                  color: Colors.white, size: 18.0),
              shape: CircleBorder(),
            ),
            Text("")
          ],
        ),
      );
    },
      itemCount: 5,
      scrollDirection: Axis.horizontal,
    );
  }
}