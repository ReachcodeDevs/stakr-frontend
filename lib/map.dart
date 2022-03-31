import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  const GMap({Key? key, required this.lat, required this.long})
      : super(key: key);
  final double lat;
  final double long;

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<GMap> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: _onMapCreated,
      markers: {
        Marker(
            markerId: const MarkerId("African Wildlife Foundation"),
            position: LatLng(widget.lat, widget.long))
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.long),
        zoom: 11.0,
      ),
    );
  }
}
