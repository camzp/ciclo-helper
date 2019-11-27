import 'package:ciclo_helper/model/maintenance.dart';
import 'package:flutter/material.dart';

class DeleteMaintenanceSnackBar extends SnackBar{

  DeleteMaintenanceSnackBar({
    Key key,
    @required Maintenance maintenance,
    @required VoidCallback onUndo,
  }) : super(
    key: key,
    content: Text(
      "Apagou \"" + maintenance.description + " " + maintenance.date + "\"",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
        label: "Desfazer",
        onPressed: onUndo),
  );
}