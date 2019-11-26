import 'package:ciclo_helper/Model/my_bike.dart';
import 'package:ciclo_helper/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBikeWidget extends StatelessWidget {
  final MyBike myBike;
  final GestureTapCallback onTap;
  final DismissDirectionCallback  onDismissed;

  MyBikeWidget({
    Key key,
    @required this.myBike,
    @required this.onTap,
    @required this.onDismissed
}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: LocalKeys.myBikeItem(myBike.id),
      onDismissed: onDismissed,
      child: ListTile(
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
      ),
    );
  }
}