import 'package:ciclo_helper/model/models.dart';
import 'package:flutter/material.dart';

class DeleteMyBikeSnackBar extends SnackBar{

  DeleteMyBikeSnackBar({
    Key key,
    @required MyBike myBike,
    @required VoidCallback onUndo,
}) : super(
    key: key,
    content: Text(
      "Apagou \"" + myBike.brand + " " + myBike.model + "\"",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
        label: "Desfazer",
        onPressed: onUndo),
  );
}