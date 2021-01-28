import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class RestaurantAddrMap extends StatefulWidget {
  final double lat;
  final double lng;
  final String title;
  RestaurantAddrMap(this.lat, this.lng, this.title);

  @override
  _RestaurantAddrMapState createState() => _RestaurantAddrMapState();
}

class _RestaurantAddrMapState extends State<RestaurantAddrMap> {
  Completer<GoogleMapController> _controller = Completer();
  static CameraPosition _kGooglePlex;
  BitmapDescriptor _markerIcon;
  LatLng _kMapCenter;

  @override
  void initState() {
    super.initState();

    _kGooglePlex = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 17,
    );

    _kMapCenter = LatLng(widget.lat, widget.lng);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GoogleMap(
        mapType: MapType.normal,
        markers: _createMarker(),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Set<Marker> _createMarker() {
    // TODO(iskakaushik): Remove this when collection literals makes it to stable.
    // https://github.com/flutter/flutter/issues/28312
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
        icon: _markerIcon,
        infoWindow: InfoWindow(
          title: widget.title,
        ),
      ),
    ].toSet();
  }
}
