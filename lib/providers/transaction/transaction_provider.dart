import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/configs/memory_veriables.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/services/FetchInspector.dart';

class TransactionProvider {
  Future<List> fetchTransactions(int userid, int limit, int offset) async {
    FetcherResponse response = await FetchInspector().get(
      path: LIST_TOPUPS_END_POINT +
          '?maker=$userid&withdrawed=false&limit=$limit&offset=$offset',
    );
    if (response.status == 200) {
      return response.body['results'];
    }
    return null;
  }
}
