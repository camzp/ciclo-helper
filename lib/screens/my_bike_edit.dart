import 'package:flutter/material.dart';
import '../Model/bike.dart';


class MyBikeEdit extends StatefulWidget {
  @override
  _MyBikeState createState() => _MyBikeState();
}

class _MyBikeState extends State<MyBikeEdit>{
  var selectedType;
  var aroType;
  var modelType;
  final _bike = Bike();
  final _formKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Minha Bike", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.donut_large, color: Colors.green[200],
                    ),
                    hintText: 'Código de Registro',
                    labelText: 'Registro',
                  ),
                  onSaved: (val) => _bike.reg = val,
                ),
                Row(
                
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 50),
                        DropdownButton(
                          items: _bike.types.map((value) =>DropdownMenuItem(
                            child: Text(                
                              value,
                              style: TextStyle(color: Colors.grey),
                            ),
                            value:value,
                          )
                          ).toList(),
                          onChanged: (selectedBikeType){
                            setState(() {
                              selectedType = selectedBikeType;                              
                            });
                          },
                          value: selectedType,
                          hint: Text("Selecione o Modelo"),
                        ),
                      ],
                      
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 50),
                        DropdownButton(
                          items: _bike.aro.map((value) =>DropdownMenuItem(
                            child: Text(                
                              value,
                              style: TextStyle(color: Colors.grey),
                            ),
                            value:value,
                          )
                          ).toList(),
                          onChanged: (selectedColor){
                            setState(() {
                              aroType = selectedColor;                              
                            });
                          },
                          value: aroType,
                          hint: Text("Selecione o Aro"),
                        ),
                      ],
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 50),
                        DropdownButton(
                          items: _bike.modelo.map((value) =>DropdownMenuItem(
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
                          hint: Text("Selecione o Modelo"),
                        ),
                      ],
                    ),
                SizedBox(height: 20),
                Container(
                  
                  child: Text('Adicionais'),
                ),
                SwitchListTile(
                  title:Text ('Suspensão'),
                  value: _bike.suspensao,
                  onChanged: (bool val)=>
                    setState(() => _bike.suspensao = val)
                    ),  
                    SizedBox(height: 3.0,),
                SwitchListTile(
                  title:Text ('Farol'),
                  value: _bike.farol,
                  onChanged: (bool val)=>
                    setState(() => _bike.farol = val)
                    ),
                    SizedBox(height: 3.0,),
                  SwitchListTile(
                  title:Text ('Retrovisor'),
                  value: _bike.retrovisor,
                  onChanged: (bool val)=>
                    setState(() => _bike.retrovisor = val)
                    ),
                    SizedBox(height: 3.0,),
                    RaisedButton(
                      child: Text(
                        "Atualizar",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.greenAccent,

                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}