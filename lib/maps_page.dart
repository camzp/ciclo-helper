import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Maps extends StatefulWidget{
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps>{

  GoogleMapController mapController;
  Position position; //posição atual
  Widget _map;
  Set<Marker> _mapMarkers = Set();

  //função para ter a localização atual do usuário
  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
     position = res;
     _map = loadMap(); //iniciar o mapa após retornar a localização para que a posição central não seja NULL
    });
  }

  void onMapCreated(GoogleMapController ctrl){
    setState(() {
      mapController = ctrl;
    });
  }
  //adicionando um marker a lista de markers
  initMarker(mrkr, mrkrID) async{
    
    final MarkerId markerId = MarkerId(mrkrID);
    BitmapDescriptor icon;
    
    if(mrkr['type'] == "event"){
      icon = BitmapDescriptor.defaultMarkerWithHue(30.0);
    }
    else if(mrkr['type'] == "util"){
      icon = BitmapDescriptor.defaultMarkerWithHue(270.0);
    }
    
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrkr['location'].latitude, mrkr['location'].longitude),
      infoWindow: InfoWindow(
        title: mrkr['markerName'].toString(), 
        snippet: mrkr['snippet'].toString(),
        onTap:(){
          deleteMarker(markerId);
        }
      ),
      icon: icon,
      draggable: false,
    );

    _mapMarkers.add(marker);
    print(markerId);
  }

  @override
  void initState(){
    getCurrentLocation();
    super.initState();
  }

  //adicionando marker ao firestore
  addMarkerToFirestore(String name, String snippet, String type) async{
    await Firestore.instance.collection('markers').add({
      'location': new GeoPoint(position.latitude, position.longitude),
      'snippet': snippet,
      'markerName': name,
      'type': type
    });
  }
  //deletando marker do firestore 
  deleteMarkerOnFirestore(MarkerId markerId) async{
    await Firestore.instance.collection('markers').document(markerId.value.toString()).delete();
  }
  //adicionar um marker ao mapa
  addMarker(){
    String name;
    String snippet;
    String type;

    var selectedType;

    List<String> types=<String>[
    'Evento',
    'Ponto de Apoio',
    'Localização',
    ];

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return new SimpleDialog(
          title: Text('Adicionar marcador'),
          children: <Widget>[
            TextField(
              onChanged: (String input){
                setState(() {
                  name = input;             
                });
              },
              decoration: InputDecoration(hintText: "Nome"),
            ),
            TextField(
              onChanged: (String input){
                setState(() {
                  snippet = input;
                });
              },
              decoration: InputDecoration(hintText: 'Descrição'),
            ),
            
            DropdownButton(
                              items: types.map((value) =>DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                value:value,
                              )
                              ).toList(),
                              onChanged: (selectedType){
                                setState(() {
                                  type = selectedType;
                                });
                              },
                              value: type,
                              hint: Text("Selecione o Tipo"),
                            ),
            FlatButton(
              child: Text('Adicionar'),
              onPressed: (){  
                Navigator.of(context).pop();
                addMarkerToFirestore(name, snippet, type);
              },
            ),
          ],
          
        );
      }
    );
  }

  deleteMarker(MarkerId markerId){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text('Excluir'),
          content: Text('Deseja excluir o marcador?'),
          actions: <Widget>[
            FlatButton(
              child: Text("Não"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: (){
                Navigator.of(context).pop();
                print(markerId.value);
                deleteMarkerOnFirestore(markerId);
                _mapMarkers.clear();
              },
            ),
          ],
        );
      }
    );
  }

  //carregando os markers do mapa
  Widget loadMap() {
    return StreamBuilder(
      stream: Firestore.instance.collection('markers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Carregando Mapas...');
        //adicionando markers do firestore ao mapa
        for (int i = 0; i < snapshot.data.documents.length; i++) {
          initMarker(snapshot.data.documents[i], snapshot.data.documents[i].documentID);
        }
        return mapWidget();
      },
    );
  }

  //criando o widget do mapa
  Widget mapWidget(){
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _mapMarkers,
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(position.latitude, position.longitude), //Localização do usuário
              zoom: 12.0
            ),
            trafficEnabled: true,
            mapToolbarEnabled: true,
            //mapType: MapType.hybrid,
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: _map,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed:() {
          addMarker();
        },
        backgroundColor: Colors.lightGreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}