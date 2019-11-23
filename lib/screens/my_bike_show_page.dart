import 'package:ciclo_helper/My_Bike_Bloc/bloc.dart';
import 'package:ciclo_helper/My_Bike_Bloc/bloc.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBikeShowPage extends StatefulWidget{
  @override
  _MyBikeShowPageState createState() => _MyBikeShowPageState();
}

class _MyBikeShowPageState extends State<MyBikeShowPage>{
  String decorator (bool vari){
    if (vari == true){
      return "Sim";
    }
    else {
      return "Não";
    }
  }
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
              body: 
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 30,
                          right: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text ("Registro:" + state.myBike.reg,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 70,
                          right: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text (state.myBike.modelo + " da Camila",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 120,
                          right: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text ("Tipo: " + state.myBike.type,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 180,
                          right: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text ("Tamanho do Quadro: " + state.myBike.quadro,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15  ,
                              ),
                            ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 200,
                          right: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text ("Aro: " + state.myBike.aro,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 300,
                          right: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text ("Farois? " + decorator(state.myBike.farol),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 350,
                          right: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text ("Suspensão? " + decorator(state.myBike.suspensao),    
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            ],
                          ),
                        ),
                        
                        
                      ],
                      
                    ),
                    
                  ),
                  ],
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