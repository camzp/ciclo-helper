import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget{
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps>{

  List<Marker> mapMarkers = [];

  GoogleMapController mapController;
  Position position;
  Widget _map;

  //função para ter a localização atual do usuário
  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
     position = res;
     _map = MapWidget(); //iniciar o mapa após retornar a localização para que o LatLng fique NULL
    });
  }

  void onMapCreated(GoogleMapController ctrl){
    mapController = ctrl;
  }

  @override
  void initState(){
    super.initState();
    mapMarkers.add(Marker(
      markerId: MarkerId('IC-UFF'),
      draggable: false,
      infoWindow: InfoWindow(title: 'IC-UFF'),
      position: LatLng(-22.906463, -43.133291),
    ));
    getCurrentLocation();
  }

  void addMarker(){
    setState(() {
     mapMarkers.add(Marker(
        markerId: MarkerId(mapMarkers.length.toString()),
        infoWindow: InfoWindow(
          title: "Teste"
        ),
        position: LatLng(position.latitude, position.longitude),
        draggable: false,
        icon: BitmapDescriptor.defaultMarker,
     )); 
    });
    print('teste');
  }

  //criando o widget do mapa
  Widget MapWidget(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        myLocationEnabled: true,
        markers: Set<Marker>.of(mapMarkers),
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