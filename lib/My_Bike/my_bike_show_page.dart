import 'package:ciclo_helper/Model/models.dart';
import 'package:ciclo_helper/My_Bike/my_bike.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBikeShowPage extends StatelessWidget{
  final int id;

  MyBikeShowPage({Key key, @required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBikeBloc, MyBikeState>(
      builder: (context, state) {
        final myBike = (state as MyBikeLoaded)
            .myBikes
            .firstWhere((myBike) => myBike.id == id, orElse: () => null);

        return Scaffold(
          appBar: AppBar(),
          body: MyBikeEditForm(isEditable: false, isShowing: true, myBike: myBike, onSave: null,),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyBikeEditForm(isEditable: true, isShowing: false, myBike: myBike, onSave:
            (myBike){
              myBike.id = id;
              BlocProvider.of<MyBikeBloc>(context).add(UpdatedMyBike(myBike));
            },))),
            child: Icon(Icons.create)
          ),
        );
      }
    );
  }

}