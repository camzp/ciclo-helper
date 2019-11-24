import 'package:ciclo_helper/My_Bike/my_bike.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBikeEditForm extends StatefulWidget{
  bool isEditable;
  MyBikeEditForm({@required this.isEditable});

  @override
  State<StatefulWidget> createState() => _MyBikeEditFormState(isEditable: isEditable);
}

class _MyBikeEditFormState extends State<MyBikeEditForm>{
  bool isEditable;

  _MyBikeEditFormState({@required this.isEditable});

  final _formKey = GlobalKey<FormState>();

  final _regController = TextEditingController();
  final _brandController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBikeBloc, MyBikeState>(
      builder: (context, state){
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                //Não consigo acessar o state para pegar o initialValue => pensei em
                // usar outro bloc para definir states
                // e com isso, conseguir acessar o MyBike passado. Além disso, o novo bloc pode
                //definir se o textfield é readonly
                //Esse novo bloc vai ter que responder à um evento lançado nao selecionar o
                //MyBikeWidget e ao clicar editar na pagina da bike.

                //Aqui na submissão do form, ele vai ter que interagir com o MyBikeBloc
                initialValue: state.,
                controller: _regController,
                readOnly: isEditable,
                decoration: InputDecoration(
                  icon: Icon(Icons.donut_large, color: Colors.green[200],
                  ),
                  hintText: 'Código de Registro',
                  labelText: 'Registro',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 50),
                  TextFormField(
                    controller:  _brandController,
                    readOnly: isEditable,
                    autovalidate: true,
                    autocorrect: false,
                  )
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 50),
                  DropdownButton(
                    items: _bike.wheel.map((value) =>DropdownMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.grey),
                      ),
                      value:value,
                    )
                    ).toList(),
                    onChanged: (wheel){
                      setState(() {
                        wheelType = wheel;
                      });
                    },
                    value: wheelType,
                    hint: Text("Selecione o wheel"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 50),
                  DropdownButton(
                    items: _bike.model.map((value) =>DropdownMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.grey),
                      ),
                      value:value,
                    )
                    ).toList(),
                    onChanged: (selectedModel){
                      setState(() {
                        modelType = selectedModel;
                      });
                    },
                    value: modelType,
                    hint: Text("Selecione o Fabricante"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(

                child: Text('Adicionais'),
              ),
              SwitchListTile(
                  title:Text ('Suspensão'),
                  value: _suspension,
                  onChanged: (bool val){
                    setState(() {
                      _suspension = val;
                    });
                  }
              ),
              SizedBox(height: 3.0,),
              SwitchListTile(
                  title:Text ('headlight'),
                  value: _headlight,
                  onChanged: (bool val){
                    setState(() {
                      _headlight = val;
                    });
                  }
              ),
              SizedBox(height: 3.0,),
              SwitchListTile(
                  title:Text ('mirror'),
                  value: _mirror,
                  onChanged: (bool val){
                    setState(() { _mirror = val; });
                  }
              ),
              SizedBox(height: 3.0,),
              RaisedButton(
                child: Text(
                  "Atualizar",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.greenAccent,
                onPressed: () => submitMyBike(),
              )
            ],
          ),
        );
      },

    );
  }

}