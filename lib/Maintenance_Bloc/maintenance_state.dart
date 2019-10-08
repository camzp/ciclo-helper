import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MaintenanceState extends Equatable {
  MaintenanceState([List props = const []]) : super(props);
}

class MaintenanceInitial extends MaintenanceState {

}
