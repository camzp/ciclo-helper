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

  final Firestore _firestore = Firestore.instance;

  Set<Marker> _mapMarkers = Set();
  GoogleMapController mapController;
  Position position;
  Widget _map;

  //função para ter a localização atual do usuário
  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
     position = res;
     _map = loadMap(); //iniciar o mapa após retornar a localização para que o LatLng não fique NULL
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
    
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrkr['location'].latitude, mrkr['location'].longitude),
      infoWindow: InfoWindow(title: mrkr['markerName'].toString()),
      draggable: false,
    );

    _mapMarkers.add(marker);
    print(markerId);
  }

  //adicionando os markers do firestore ao mapa
  /*populateMap(){
    _firestore.collection('markers').getDocuments().then((docs){
      if(docs.documents.isNotEmpty){
        for(int i = 0; i < docs.documents.length; i++){
          initMarker(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }*/

  @override
  void initState(){
    getCurrentLocation();
    super.initState();
  }

  //adicionando marker ao firestore
  addMarkerToFirestore(String name) async{
    await _firestore.collection('markers').add({
      'location': new GeoPoint(position.latitude, position.longitude),
      'markerName': name
    });
  }
  //deletando marker do firestore 
  deleteMarkerOnFirestore(){
    
  }
  //adicionar um marker ao mapa
  addMarker(){

    addMarkerToFirestore('teste');
  }

  deleteMarker(){
    
  }

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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        myLocationEnabled: true,
        markers: _mapMarkers,
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(position.latitude, position.longitude), //Localização do usuário
          zoom: 12.0
        ),
        //mapType: MapType.hybrid,
      ),
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