import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maskapp/model/restaurant.dart';

class RestaurantRepository {
  Future<List<Row1>> fetch(int start, int end) async {
    print('RestaurantRepository start :: $start ');
    print('RestaurantRepository end :: $end ');

    final row = List<Row1>();

    var url =
        'http://openAPI.jungnang.seoul.kr:8088/41785a4473776177313030536e7a5a76/json/JungnangModelRestaurantDesignate/$start/$end';

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);

        body['JungnangModelRestaurantDesignate']['row'].forEach((e) {
          final row_json = Row1.fromJson(e);
          row.add(row_json);
        });

        print(row.toList());
        print('RestaurantRepository row length :: ${row.length}');

        return row.toList();
      } else {
        return [];
      }
    } catch (e) {
      print('http error :: $e');
      return [];
    }
  }

  Future<List<RESULT>> fetch2() async {
    final result = List<RESULT>();

    var url =
        'http://openAPI.jungnang.seoul.kr:8088/41785a4473776177313030536e7a5a76/json/JungnangModelRestaurantDesignate/1/10';

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        String bodyString = utf8.decode(response.bodyBytes);
        final body = jsonDecode(bodyString);
        final result1 =
            RESULT.fromJson(body['JungnangModelRestaurantDesignate']['RESULT']);
        result.add(result1);

//        body['JungnangModelRestaurantDesignate']['RESULT'].forEach((e) {
//          final result1 = RESULT.fromJson(e);
//          result.add(result1);
//        });

        return result;
      } else {}
    } catch (e) {
      print('http error :: $e');
    }
  }
}
