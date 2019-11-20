import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ciclo_helper/Model/models.dart';
import 'package:ciclo_helper/Tab_Bloc/tab_event.dart';


class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.todos;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
