import 'package:ciclo_helper/My_Bike_Bloc/bloc.dart';
import 'package:ciclo_helper/My_Bike_Bloc/bloc.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBikeShowPage extends StatefulWidget{
  @override
  _MyBikeShowPageState createState() => _MyBikeShowPageState();
}

class _MyBikeShowPageState extends State<MyBikeShowPage>{

  @override
  Widget build(BuildContext context) {
    final MyBikeBloc _myBikeBloc = BlocProvider.of<MyBikeBloc>(context);
    return BlocProvider(
      bloc: _myBikeBloc,
      child: BlocBuilder(
        bloc: _myBikeBloc,
        // ignore: missing_return
        builder: (BuildContext context, MyBikeState state){
          if (state is MyBikeLastLoaded){
            return Scaffold(
              appBar: AppBar(
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    _myBikeBloc.dispatch(LoadMyBike());
                    Navigator.pop(context);
                  },
                ),
              ),
              body: ListView(
                children: <Widget>[
                  Text(state.myBike.reg),
                  Text(state.myBike.type),
                  Text(state.myBike.modelo),
                  Text(state.myBike.quadro),
                  Text(state.myBike.aro),
                  Text(state.myBike.farol.toString()),
                  Text(state.myBike.suspensao.toString())],
              ),
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}