

import 'package:ciclo_helper/my_bike/my_bike.dart';
import 'package:ciclo_helper/my_bike/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MyBikeListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Bike'),
        backgroundColor: Colors.green,
      ),
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push((context), MaterialPageRoute(builder: (context) => MyBikeAddPage())),
        tooltip: 'Adicionar uma bike',
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<MyBikeListBloc, MyBikeListState>(
        builder: (context, state) {
          if (state is MyBikeListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is MyBikeListLoaded){
            final myBikes = state.myBikes;
            return ListView.builder(
                itemCount: myBikes.length,
                itemBuilder: (BuildContext context, int index){
                  final myBike = myBikes[index];
                  return MyBikeWidget(
                    myBike: myBike,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_){
                        return MyBikeShowPage(id: myBike.id);
                      }
                    ),),
                    onDismissed: (direction){
                      BlocProvider.of<MyBikeBloc>(context).add(DeletedMyBike(myBike));
                      Scaffold.of(context).showSnackBar(DeleteMyBikeSnackBar(
                        myBike: myBike,
                        onUndo: () => BlocProvider.of<MyBikeBloc>(context).add(AddedMyBike(myBike)),));
                    },
                  );
                },);
          }
          return Container();
        }
      )
    );
  }
}