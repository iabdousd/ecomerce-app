import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/services/FetchInspector.dart';

class AuthProvider {
  Future<Map> fetchUser() async {
    FetcherResponse detailsResponse = await FetchInspector().get(
      path: GET_USER_END_POINT,
    );

    if (detailsResponse.status != 200) return null;
    return detailsResponse.body;
  }

  Future<Map> fetchBalance(int id) async {
    FetcherResponse response = await FetchInspector().get(
      path: GET_BALANCE_END_POINT.replaceAll('<p1>', id.toString()),
    );
    if (response.status == 200) {
      return response.body;
    }
    return null;
  }
}
