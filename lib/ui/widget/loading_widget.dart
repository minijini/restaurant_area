import 'package:flutter/material.dart';

Widget LoadingWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(' 정보를 가져오는 중'),
        Padding(padding: EdgeInsets.all(15.0)),
        CircularProgressIndicator(
          backgroundColor: Colors.cyanAccent,
        )
      ],
    ),
  );
}