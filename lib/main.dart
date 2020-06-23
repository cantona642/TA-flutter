import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
//import 'place_marker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const LatLng _center = const LatLng(-6.2310296, 106.8527276);
  final Set<Polyline> _polyline = {};
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  //StatefulMapController statefulMapController;

  //final LatLng _center = const LatLng(45.521563, -122.677433);
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/testmarker.png');
  }

  /*@override
  void iniState() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5), 
      'assets/testmarker.png').then((onValue){
      pinLocationIcon = onValue;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    Map markers = {};
    LatLng _lastMapPosition = _center;
    List<LatLng> latlng = List();
    List listMarkerIds = List();

    LatLng pinPosition = LatLng(-6.2310296, 106.8527276); //rumah lia
    LatLng pinPositions = LatLng(-6.2384239, 106.847541); // circle K

    latlng.add(pinPosition);
    latlng.add(pinPositions);

    CameraPosition initialLocation =
        CameraPosition(zoom: 11, bearing: 30, target: pinPosition);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          //onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          compassEnabled: true,
          markers: _markers,
          polylines: _polyline,
          initialCameraPosition: initialLocation,
          //markers: Set.of(markers.values),

          onMapCreated: (GoogleMapController controller) {
            //mapController = controller;

            /*MarkerId markerId1 = MarkerId("1");
            MarkerId markerId2 = MarkerId("2");

            listMarkerIds.add(markerId1);
            listMarkerIds.add(markerId2);

            Marker marker1 = Marker(
                markerId: markerId1,
                position: LatLng(-6.2310296,106.8527276),
                icon: pinLocationIcon,
                infoWindow: InfoWindow(
                    title: "Rumah lia", snippet: "Snipet Hitech City"));
            
            Marker marker2 = Marker(
                markerId: markerId2,
                position: LatLng(-6.2384239,106.847541),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueCyan),
                infoWindow: InfoWindow(
                    title: "Circle K", snippet: "Snipet Hitech City"));*/

            setState(() {
              //markers[markerId1]=marker1;
              //markers[markerId2]=marker2;
              _markers.add(Marker(
                  markerId: MarkerId(_lastMapPosition.toString()),
                  //visible: true,
                  position: _lastMapPosition,
                  icon: pinLocationIcon,
                  infoWindow: InfoWindow(
                    title: 'Locattion',
                    snippet: '5 Star Rating',
                  )));
              _polyline.add(Polyline(
                polylineId: PolylineId(_lastMapPosition.toString()),
                visible: true,
                points: latlng,
                color: Colors.blue,
              ));
            });
          },

//          rotateGesturesEnabled: true,
//          scrollGesturesEnabled: true,
//          tiltGesturesEnabled: true,
        ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(-6.223552, 106.848581), zoom: 13.0),
              ),
            );
          },
        ),*/
      ),
    );
  }
}
