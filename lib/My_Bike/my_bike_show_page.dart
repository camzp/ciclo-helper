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
        final myBike = (state as MyBikeLoaded).myBike.firstWhere((myBike) => myBike.id == id, orElse: () => null);
        return Scaffold(
          body: MyBikeEditForm(isEditable: true,),
        );
      }
    );
  }

}