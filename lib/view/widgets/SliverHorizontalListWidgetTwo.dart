import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/home/Ecart.dart';
import '../../res/colors/Colors.dart';

class SliverHorizontalListWidgetTwo extends StatefulWidget {

  const SliverHorizontalListWidgetTwo(
  {Key? key, required this.widgetTabList}
  ) : super(key: key);

  final List<WidgetComponentDetailsECart> widgetTabList;


  @override
  State<SliverHorizontalListWidgetTwo> createState() => _SliverHorizontalListWidgetTwoState();
}

class _SliverHorizontalListWidgetTwoState extends State<SliverHorizontalListWidgetTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
      return Card(
        color: colorPink,
        child: Column(
          children: [
            MaterialButton(
                onPressed: () {
                  },
                color: colorGreen,
                textColor: Colors.white,
                child: Icon(FontAwesomeIcons.facebook,
                    color: Colors.white, size: 18.0),
                shape: CircleBorder(),
              ),
            Text(widget.widgetTabList[index].name??"NA")
          ],
        ),
      );
    },
      itemCount: widget.widgetTabList.length,
      scrollDirection: Axis.horizontal,
    );
  }
}