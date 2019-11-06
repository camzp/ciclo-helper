import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget{
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps>{

  List<Marker> mapMarkers = [];

  GoogleMapController _mapController;
  //Location _userLocation = Location();

  void onMapCreated(GoogleMapController ctrl){
    _mapController = ctrl;
    /*_userLocation.onLocationChanged().listen((l){
      _mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(l.latitude, l.longitude),
              zoom: 12.0,
            ),
          ),
        );
    });*/
  }

  @override
  void initState(){
    super.initState();
    mapMarkers.add(Marker(
      markerId: MarkerId('Teste'),
      draggable: false,
      infoWindow: InfoWindow(title: 'IC-UFF'),
      onTap: () {
        print('IC-UFF');
      },
      position: LatLng(-22.906463, -43.133291),
    ));
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-22.906463, -43.133291), //Instituto de Computação UFF
              zoom: 12.0
            ),
            myLocationEnabled: true,
            markers: Set.from(mapMarkers),
            //mapType: MapType.hybrid,
          ),
        ),
      ),
    );
  }
}