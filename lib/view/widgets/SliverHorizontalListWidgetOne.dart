import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/home/Ecart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/colors/Colors.dart';

class SliverHorizontalListWidgetOne extends StatefulWidget {

  const SliverHorizontalListWidgetOne(
  {Key? key, required this.widgetTabList}
  ) : super(key: key);

  final List<WidgetComponentDetailsECart> widgetTabList;


  @override
  State<SliverHorizontalListWidgetOne> createState() => _SliverHorizontalListWidgetOneState();
}

class _SliverHorizontalListWidgetOneState extends State<SliverHorizontalListWidgetOne> {
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