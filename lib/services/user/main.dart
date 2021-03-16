import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/configs/memory_veriables.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/models/user/user.dart';
import 'package:rimlines/services/auth/logout.dart';

import '../FetchInspector.dart';

fetchUser() async {
  FetcherResponse detailsResponse = await FetchInspector().get(
    path: GET_USER_END_POINT,
  );
  if (detailsResponse.status != 200) return await signOut(push: false);
  currentUser = User.fromJson(detailsResponse.body);
}
