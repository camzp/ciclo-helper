import 'package:ciclo_helper/Model/my_bike.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBikeWidget extends StatelessWidget {
  final MyBike myBike;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;

  MyBikeWidget({
    Key key,
    @required this.myBike,
    @required this.onTap,
    @required this.onCheckboxChanged
}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        myBike.brand + " " + myBike.model,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        myBike.color,
        style: Theme.of(context).textTheme.subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}