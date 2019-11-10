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

  Map<MarkerId, Marker> mapMarkers = <MarkerId, Marker>{};
  GoogleMapController mapController;
  Position position;
  Widget _map;

  //função para ter a localização atual do usuário
  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
     position = res;
     _map = MapWidget(); //iniciar o mapa após retornar a localização para que o LatLng não fique NULL
    });
  }

  void onMapCreated(GoogleMapController ctrl){
    mapController = ctrl;
  }

  //adicionando um marker a lista de markers
  initMarker(mrkr, mrkrID){
    final MarkerId markerId = MarkerId(mrkrID);
    
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrkr['location'].latitude, mrkr['location'].longitude),
      infoWindow: InfoWindow(title: mrkr['markerName'].toString()),
      draggable: false,
    );

    setState(() {
      mapMarkers[markerId] = marker;
      print(markerId);
    });
  }

  //adicionando os markers do firestore ao mapa
  populateMap(){
    _firestore.collection('markers').getDocuments().then((docs){
      if(docs.documents.isNotEmpty){
        for(int i = 0; i < docs.documents.length; i++){
          initMarker(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  @override
  void initState(){
    super.initState();
    getCurrentLocation();
    populateMap();
  }

  //adicionar um marker ao mapa
  void addMarker(){
    /*setState(() {
     mapMarkers.add(Marker(
        markerId: MarkerId(mapMarkers.length.toString()),
        infoWindow: InfoWindow(
          title: "Teste"
        ),
        position: LatLng(position.latitude, position.longitude),
        draggable: false,
        icon: BitmapDescriptor.defaultMarker,
     )); 
    });*/
    print('teste');
  }

  //criando o widget do mapa
  Widget MapWidget(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        myLocationEnabled: true,
        markers: Set<Marker>.of(mapMarkers.values),
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
        onPressed: addMarker,
        backgroundColor: Colors.lightGreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}