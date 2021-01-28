import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:maskapp/model/restaurant.dart';
import 'package:maskapp/repository/address_lat_lng_repository.dart';
import 'package:maskapp/ui/widget/loading_widget.dart';
import 'package:maskapp/ui/widget/restaurant_addr_map.dart';

class RestaurantListTileDetail extends StatefulWidget {
  final Row1 row;

  RestaurantListTileDetail(this.row);

  @override
  _RestaurantListTileDetailState createState() =>
      _RestaurantListTileDetailState();
}

class _RestaurantListTileDetailState extends State<RestaurantListTileDetail> {
  Address latlng;
  Map<dynamic, dynamic> latlng_result;
  var lat;
  var lng;
  final _addresslatlngrepository = AddressLatLngRepository();

  @override
  void initState() {
    super.initState();
    getlatlng(widget.row.siteaddrrd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
            child: Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Text(widget.row.upsonm),
        )),
      ),
      body: detail(),
    );
  }

  Widget detail() {
    if (widget.row.lat == null || widget.row.lng == null) {
      return LoadingWidget();
    } else {
      return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '대표음식 : ${widget.row.mainedf}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '전화번호 : ${widget.row.upsositetelno}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '주소 : ${widget.row.siteaddrrd}',
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Text(
              '위치 ☆',
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            RestaurantAddrMap(double.parse(widget.row.lat.toString()),
                double.parse(widget.row.lng.toString()), widget.row.upsonm),
          ],
        ),
      );
    }
  }

  getlatlng(String siteaddr) async {
    latlng = await _addresslatlngrepository.geododer(siteaddr);

    latlng_result = latlng.coordinates.toMap() != null
        ? latlng.coordinates.toMap()
        : 'empty'; //위도경도 구하기

    setState(() {
      lat = latlng_result['latitude'];
      lng = latlng_result['longitude'];

      widget.row.lat = lat;
      widget.row.lng = lng;
    });

    print('RestaurantListTileDetail :: ' + lat.toString());
    print('RestaurantListTileDetail :: ' + lng.toString());
  }
}
