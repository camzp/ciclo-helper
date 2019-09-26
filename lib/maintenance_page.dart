import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaintenancePage extends StatefulWidget {
  @override
  _MaintenancePage createState() => _MaintenancePage();
}

class _MaintenancePage extends State<MaintenancePage> {
  final controllerPD = TextEditingController();
  final controllerPP = TextEditingController();
  final controllerLD = TextEditingController();

  List<String> listPD = [];
  List<String> listPP = [];
  List<String> listLD = [];

  @override
  void dispose() {
    controllerPD.dispose();
    controllerPP.dispose();
    controllerLD.dispose();
    super.dispose();
  }

  void addFieldsContents() {
    //TODO: melhorar essa checagem e adicionar algum erro para o usuário caso caia no else
    if (controllerPP.text != '') {
      if (controllerPD.text != '') {
        listPD.add(controllerPD.text);
        listPP.add(controllerPP.text);
      }
    }
    if (controllerLD.text != '') {
      listLD.add(controllerLD.text);
    }
  }
  //TODO: mudar siglas ou ver um jeito de mostrar o que são
  //TODO: limitar o formato das strings que o usuário pode inserir

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: new Text('Maintenance')),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  child: Table(
                    children: [
                      TableRow(children: [
                        Text(
                          'PD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'PP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'LD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          width: 50,
                          height: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: controllerPD,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: controllerPP,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: controllerLD,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ])
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                    iconSize: 50,
                    color: Color.fromRGBO(0, 100, 30, 1.0),
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      addFieldsContents();
                      controllerLD.clear();
                      controllerPP.clear();
                      controllerPD.clear();
                      setState(() {});
                    },
                  ),
                )),
            Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(border: Border(top: BorderSide(color:Colors.black54,width: 8.0)) ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child:
                          Container(
                            decoration: BoxDecoration(border: Border(right:BorderSide(color:Colors.black54,width: 8.0) )),
                            child:ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: listPD.length,
                              itemBuilder: (BuildContext context, int Index) {
                                return Text(listPD[Index],
                                  style: TextStyle(fontSize: 24),textAlign: TextAlign.center,);
                            }),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(border: Border(right:BorderSide(color:Colors.black54,width: 8.0) )),
                          child:ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: listPP.length,
                            itemBuilder: (BuildContext context, int Index) {
                              return Text(listPP[Index],
                                style: TextStyle(fontSize: 24), textAlign: TextAlign.center,);
                            }),),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(child:ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: listLD.length,
                              itemBuilder: (BuildContext context, int Index) {
                                return Text(
                                  listLD[Index],
                                  style: TextStyle(fontSize: 24), textAlign: TextAlign.center,
                                );
                              })))
                    ],
                  ),
                ))
          ],
        ));
  }
}
