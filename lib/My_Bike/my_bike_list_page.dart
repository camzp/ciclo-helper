import 'package:ciclo_helper/My_Bike/My_Bike_List_Bloc/bloc.dart';
import 'package:ciclo_helper/My_Bike/my_bike_add_page.dart';
import 'package:ciclo_helper/My_Bike/my_bike_show_page.dart';
import 'package:ciclo_helper/My_Bike/widgets/delete_snackbar.dart';
import 'package:ciclo_helper/My_Bike/widgets/my_bike_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_bike.dart';

class MyBikeListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Acredito que o Bloc tá fechando quando usa o builder. Tem que ver como resolver isso

    return Scaffold(
      appBar: AppBar(
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