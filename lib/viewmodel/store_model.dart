import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maskapp/model/store.dart';
import 'package:maskapp/repository/location_repository.dart';
import 'package:maskapp/repository/store_repository.dart';
import 'package:provider/provider.dart';

class StoreModel with ChangeNotifier {
  List<Store> stores = [];

  var isLoading = false;

  //with : 상속과 같은 개념
  final _storeRepository = StoreRepository();

  final _locationRepository = LocationRepository();

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners(); //내용이 변경된걸 완료알려줌

    Position position = await _locationRepository.getCurrentLocation();
    stores =
        await _storeRepository.fetch(position.latitude, position.longitude);

    isLoading = false;
    notifyListeners(); //내용이 변경된걸 완료알려줌
  }
}
