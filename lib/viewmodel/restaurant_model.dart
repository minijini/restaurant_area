import 'package:flutter/cupertino.dart';
import 'package:maskapp/model/restaurant.dart';
import 'package:maskapp/repository/address_lat_lng_repository.dart';
import 'package:maskapp/repository/restaurant_repository.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';

class RestaurantModel with ChangeNotifier {
  List<Row1> row = [];
  List<Row1> row_result = [];
  List<Row1> row_search_result = [];
  List<RESULT> result_list = [];
  Map<String, dynamic> result;

  var start = 1;
  var end = 10;

  var isLoading = false;

  //with : 상속과 같은 개념
  final _restaurantRepository = RestaurantRepository();

//  Address latlng;
//  Map<dynamic, dynamic> latlng_result;
//  var lat;
//  var lng;
//  final _addresslatlngrepository = AddressLatLngRepository();

  RestaurantModel() {
    fetch(true);
  }

  Future fetch(bool st) async {
    if (st == true) {
      start = 1;
      end = 10;
      row_result.clear();
      isLoading = true;
      notifyListeners(); //내용이 변경된걸 완료알려줌

    }

    print('index start1 :: $start ');
    print('index end1 :: $end ');

    row = await _restaurantRepository.fetch(start, end);

    row.forEach((e) async {
//      final addr_result = await getlatlng(e.siteaddr);
//
//      lat = addr_result['latitude'];
//      lng = addr_result['longitude'];
//
//      print('RestaurantModel :: ' + lat.toString());
//      print('RestaurantModel :: ' + lng.toString());
//
//      e.lat = lat;
//      e.lng = lng;

      row_result.add(e);
    });
    isLoading = false;
    notifyListeners(); //내용이 변경된걸 완료알려줌

    print('RestaurantModel row length :: ${row.length} ');
    print('RestaurantModel row_result length :: ${row_result.length} ');

    start += 10;
    end += 10;

    print('index start2 :: $start ');
    print('index end2 :: $end ');

//    result_list = await _restaurantRepository.fetch2();
  }

  Future search(String searchtxt) {
    print('model :: $searchtxt');
    row_search_result.clear();
    row_result.where((txt) => txt.upsonm.contains(searchtxt)).forEach((e) {
      print(e.upsonm);
      row_search_result.add(e);
    });

    print(
        'RestaurantModel row_search_result length :: ${row_search_result.length} ');
  }

//  Future<Map> getlatlng(String siteaddr) async {
//    latlng = await _addresslatlngrepository
//        .geododer(siteaddr.substring(siteaddr.lastIndexOf(',') + 1));
//
//    latlng_result = latlng.coordinates.toMap() != null
//        ? latlng.coordinates.toMap()
//        : 'empty'; //위도경도 구하기
//
//    return latlng_result;
//  }
}
