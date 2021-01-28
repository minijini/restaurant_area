import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskapp/ui/view/jnrestaurant_search.dart';
import 'package:maskapp/ui/widget/loading_widget.dart';
import 'package:maskapp/ui/widget/restaurant_list_tile.dart';
import 'package:maskapp/viewmodel/restaurant_model.dart';
import 'package:provider/provider.dart';

class JNRestaurant extends StatefulWidget {
  @override
  _JNRestaurantState createState() => _JNRestaurantState();
}

class _JNRestaurantState extends State<JNRestaurant> {
  @override
  Widget build(BuildContext context) {
    final restaurantModel = Provider.of<RestaurantModel>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            '중랑구 모범음식점',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              children: [
                FlatButton(
                  child: Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return JNRestaurantSearchPage();
                    }));
                  },
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    restaurantModel.fetch(true);
                  },
                ),
              ],
            ),
          ]),
      body: bodylist(restaurantModel),
    );
  }

  Widget bodylist(RestaurantModel restaurantModel) {
    if (restaurantModel.isLoading) {
      return LoadingWidget();
    }

    if (restaurantModel.isLoading == false) {
      return Center(
        child: Container(
//            child: FlatButton(
//          child: Text('json 호출'),
//          onPressed: () {
//            print(restaurantModel.row.length);
//            print(restaurantModel.row.map((e) => e.applymd));
//            print(restaurantModel.result_list);
//            print(restaurantModel.result_list.map((e) => e.code));
//            print(restaurantModel.result_list.map((e) => e.message));
//          },
//        )

          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification) {
                print('scroll endend');

                restaurantModel.fetch(false);
              }
              return false;
            },
            child: ListView(
              children: restaurantModel.row_result.map((e) {
                return RestaurantListTile(e);
              }).toList(),
            ),
          ),
        ),
      );
    }
  }
}
