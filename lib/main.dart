import 'package:flutter/material.dart';
import 'package:maskapp/model/store.dart';
import 'package:maskapp/ui/view/jnrestaurant.dart';
import 'package:maskapp/ui/view/myhompage.dart';
import 'package:maskapp/viewmodel/restaurant_model.dart';
import 'package:maskapp/viewmodel/store_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ChangeNotifierProvider.value(value: RestaurantModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: ChangeNotifierProvider.value(
//          value: StoreModel(), child: MyHomePage()),

      home: JNRestaurant(),
    );
  }
}
