import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/configs/memory_veriables.dart' as mv;
import 'package:rimlines/configs/memory_veriables.dart';
import 'package:rimlines/constants/auth/main.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/models/user/user.dart';
import 'package:rimlines/services/FetchInspector.dart';
import 'package:rimlines/services/shared/feed-back/flush_bar.dart';
import 'package:rimlines/services/shared/feed-back/loader.dart';

Future<int> signin(String username, String password) async {
  toggleLoading(state: true);
  FetcherResponse response = await FetchInspector().post(
    path: LOGIN_END_POINT,
    body: {
      'username': username,
      'password': password,
    },
  );
  if (response.status == 200) {
    print(response.body);
    mv.jwtToken = 'Bearer ' + response.body['access'];
    await FetchInspector().initialize();
    FetcherResponse detailsResponse = await FetchInspector().get(
      path: GET_USER_END_POINT,
    );
    print(detailsResponse.status);
    print(detailsResponse.body);

    if (detailsResponse.status == 200) {
      final storage = new FlutterSecureStorage();
      await storage.write(key: jwtKey, value: mv.jwtToken);
      currentUser = User.fromJson(detailsResponse.body);
      toggleLoading(state: false);
      return 0;
    }
    mv.jwtToken = null;
    toggleLoading(state: false);
    showFlushBar(
      title: 'login.messages.error-title'.tr(),
      message: response.message,
    );
    return -1;
  }
  toggleLoading(state: false);
  showFlushBar(
    title: 'login.messages.error-title'.tr(),
    message: response.message,
  );

  return -2;
}
