import 'package:flutter/material.dart';
import 'package:maskapp/model/restaurant.dart';
import 'package:maskapp/ui/widget/restaurant_list_tile.dart';
import 'package:maskapp/viewmodel/restaurant_model.dart';
import 'package:provider/provider.dart';

class JNRestaurantSearchPage extends StatefulWidget {
  @override
  _JNRestaurantSearchPageState createState() => _JNRestaurantSearchPageState();
}

class _JNRestaurantSearchPageState extends State<JNRestaurantSearchPage> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";
  Size size;

  _JNRestaurantSearchPageState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
        print(_searchText);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final restaurantModel = Provider.of<RestaurantModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('모범음식점 검색'),
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: [
            Container(
              height: 80,
              color: Colors.amberAccent,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 6,
                      child: TextField(
                        focusNode: focusNode,
                        style: TextStyle(fontSize: 15),
                        autofocus: true,
                        controller: _filter,
                        decoration: InputDecoration(
                            fillColor: Colors.white12,
                            filled: true,
//                            prefixIcon: Icon(
//                              Icons.search,
//                              color: Colors.black,
//                              size: 20,
//                            ),
//                            suffixIcon: focusNode.hasFocus
//                                ? IconButton(
//                                    icon: Icon(
//                                      Icons.cancel,
//                                      color: Colors.black,
//                                      size: 18,
//                                    ),
//                                    onPressed: () {
//                                      setState(() {
//                                        _filter.clear();
//                                        _searchText = "";
//                                      });
//                                    },
//                                  )
//                                : Container(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed: () {
                                restaurantModel.search(_searchText);
                              },
                            ),
                            hintText: '모범 음식점 검색',
                            labelStyle: TextStyle(color: Colors.amberAccent),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                      )),
                  focusNode.hasFocus
                      ? Expanded(
                          child: FlatButton(
                          color: Colors.white,
                          child: Text(
                            '취소',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                              focusNode.unfocus();
                            });
                          },
                        ))
                      : Expanded(
                          flex: 0,
                          child: Container(),
                        )
//                  Expanded(
//                      child: FlatButton(
//                    child: Text(
//                      '취소',
//                      style: TextStyle(color: Colors.black),
//                    ),
//                    onPressed: () {
//                      setState(() {
//                        _filter.clear();
//                        _searchText = "";
//                        focusNode.unfocus();
//                      });
//                    },
//                  ))
                ],
              ),
            ),
            _buildBody(context, restaurantModel)
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, RestaurantModel restaurantModel) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: restaurantModel.row_search_result.map((e) {
          return RestaurantListTile(e);
        }).toList(),
      ),
    );
  }
}
