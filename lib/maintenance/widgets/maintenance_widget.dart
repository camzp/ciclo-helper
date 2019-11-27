import 'package:ciclo_helper/keys.dart';
import 'package:ciclo_helper/model/maintenance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaintenanceWidget extends StatelessWidget {
  final Maintenance maintenance;
  final DismissDirectionCallback  onDismissed;

  MaintenanceWidget({
    Key key,
    @required this.maintenance,
    @required this.onDismissed
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: LocalKeys.maintenanceItem(maintenance.id),
      onDismissed: onDismissed,
      child: Card(
        child: ListTile(
          title: Text(
            maintenance.description,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
            maintenance.obs,
            style: Theme.of(context).textTheme.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: SizedBox(
            width: 75,
            child: Text(
              maintenance.date,
              style: Theme.of(context).textTheme.body2,
            ),
          ),
        ),
      ),
    );
  }
}