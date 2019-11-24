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
    
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(mrkr['location'].latitude, mrkr['location'].longitude),
      infoWindow: InfoWindow(
        title: mrkr['markerName'].toString(), 
        snippet: mrkr['snippet'].toString(), 
        onTap: (){
          deleteMarker(markerId);
        }
      ),
      draggable: false,
      consumeTapEvents: false,
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
  addMarkerToFirestore(String name) async{
    await _firestore.collection('markers').add({
      'location': new GeoPoint(position.latitude, position.longitude),
      'snippet': 'teste',
      'markerName': name
    });
  }
  //deletando marker do firestore 
  deleteMarkerOnFirestore(MarkerId markerId) async{
    await _firestore.collection('markers').document(markerId.toString()).delete();
  }
  //adicionar um marker ao mapa
  addMarker(){

    addMarkerToFirestore('teste');
  }

  deleteMarker(MarkerId markerId){
    print(markerId);
    _mapMarkers.removeWhere((test) => test.markerId == markerId);
    deleteMarkerOnFirestore(markerId);
  }

  //carregando os markers do mapa
  Widget loadMap() {
    return StreamBuilder(
      stream: _firestore.collection('markers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Carregando Mapas...');
        //adicionando markers do firestore ao mapa
        print('Markers:\n');
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
          routes();//addMarker();
        },
        backgroundColor: Colors.lightGreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}