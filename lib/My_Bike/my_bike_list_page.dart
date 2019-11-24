
import 'package:ciclo_helper/Model/my_bike.dart';
import 'package:ciclo_helper/My_Bike/my_bike_show_page.dart';
import 'package:ciclo_helper/My_Bike/widgets/delete_snackbar.dart';
import 'package:ciclo_helper/My_Bike/widgets/my_bike_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_bike.dart';

class MyBikeListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyBikeBloc>(
      builder: (context) => MyBikeBloc(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
        ),
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push((context), MaterialPageRoute(builder: (context) => MyBikeEdit())),
          tooltip: 'Adicionar uma bike',
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<MyBikeBloc, MyBikeState>(
          builder: (context, state) {
            if (state is MyBikeLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is MyBikeLoaded){
              final myBikes = state.myBike;
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
                      )),
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
      ),
    );
  }
}