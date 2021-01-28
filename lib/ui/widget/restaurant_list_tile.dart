import 'package:flutter/material.dart';
import 'package:maskapp/model/restaurant.dart';
import 'package:maskapp/ui/widget/restaurant_list_tile_detail.dart';

class RestaurantListTile extends StatelessWidget {
  final Row1 row;

  RestaurantListTile(this.row);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListTile(
      title: Text(
        row.upsonm,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 3.0)),
          Text(
            '주소 : ${row.siteaddrrd}',
            style: TextStyle(fontSize: 15.0),
          ),
          Text(
            '대표음식 : ${row.mainedf}',
            style: TextStyle(fontSize: 15.0),
          ),
          Padding(padding: EdgeInsets.only(bottom: 3.0, top: 3.0)),
          Container(
            height: 1.0,
            width: size.width,
            color: Colors.grey,
          )
        ],
      ),

      onTap: () {
        print(row.upsonm);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RestaurantListTileDetail(row);
        }));
      }, //뒤에
    );
  }
}
