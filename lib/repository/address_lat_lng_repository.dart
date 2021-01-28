import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';

class AddressLatLngRepository {
  Future<Address> geododer(String query) async {
    List<Address> addresses;

    // From a query
    var result = await Geocoder.local.findAddressesFromQuery(query);
    addresses = result;
    Address address = addresses[0];
//    Map<dynamic, dynamic> latlng = address.coordinates.toMap() != null
//        ? address.coordinates.toMap()
//        : 'empty'; //위도경도 구하기

    print("geocoder result :: $address");

    return address;
  }
}
