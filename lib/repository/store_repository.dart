import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:maskapp/model/store.dart';

class StoreRepository {
  final _distance = Distance();

  Future<List<Store>> fetch(double lat, double lng) async {
    final stores = List<Store>();

    var url =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=$lat&lng=$lng&m=1000';

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(response.body);

        final jsonStores = jsonResult['stores'];

        print('store jsonResult :: $jsonResult');
        print('store jsonStores :: $jsonStores');

        jsonStores.forEach((e) {
          final store = Store.fromJson(e);
          final km = _distance.as(LengthUnit.Kilometer,
              LatLng(store.lat, store.lng), LatLng(lat, lng));
          store.km = km;
          stores.add(store);
        });

        print('store json :: $stores');

//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');
//    print('Response body: ${utf8.decode(response.bodyBytes)}');
//    print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');

        print('fetch() 완료');

        return stores.where((e) => e.remainStat == 'plenty').toList()
          ..sort((a, b) => a.km.compareTo(b.km)); //오름차순 정렬

      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
