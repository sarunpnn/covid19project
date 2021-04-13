import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_covidapp/covidtrack.dart';
import 'package:project_covidapp/Covidarea.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class GMap extends StatefulWidget {

  Covidarea _dataAreaFromWebAPI;
  GMap({Key key}) : super(key: key);
  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();
  bool _showMapStyle = false;
  LocationData currentLocation;
  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;
  BitmapDescriptor _goodIcon;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }


  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/icons/man.png');
    _goodIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/icons/good.png');
  }

  void _toggleMapStyle() async {
    String style = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');

    if (_showMapStyle) {
      _mapController.setMapStyle(style);
    } else {
      _mapController.setMapStyle(null);
    }
  }


  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    int i = 1;
    for (i = 1; i < 73; i++) {
      setState(() {
        _markers.add(
          Marker(
              markerId: MarkerId("0"),
              position: LatLng(13.8370901, 99.8676534),
              infoWindow: InfoWindow(
                title: "Your location",
                snippet: "You Stay",
              ),
              icon: BitmapDescriptor.defaultMarker),
        );
        _markers.add(
          Marker(
            markerId: MarkerId(covid[i].title),
            position: LatLng(covid[i].lat1, covid[i].lat2),
            infoWindow: InfoWindow(
              title: covid[i].title,
              snippet: covid[i].snippet,
            ),
            icon: _markerIcon,
          ),
        );
      });

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Covid-19 Map'),
          backgroundColor: Colors.blueAccent.withOpacity(0.9),elevation: 100,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(13.8370901,99.8676534),
              zoom: 14,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.map),
        onPressed: () {
          setState(() {
            _showMapStyle = !_showMapStyle;
          });

          _toggleMapStyle();
        },
      ),
    );
  }
}