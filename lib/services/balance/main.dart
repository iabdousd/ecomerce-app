import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/services/FetchInspector.dart';

Future<int> fetchBalance() async {
  FetcherResponse response = await FetchInspector().get(
    path: GET_BALANCE_END_POINT,
  );
  print(response.status);
  print(response.body);
  if (response.status == 200) {
    return response.body;
  }
  return 0;
}
