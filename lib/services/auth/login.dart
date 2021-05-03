import 'package:easy_localization/easy_localization.dart';

import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/services/FetchInspector.dart';
import 'package:rimlines/services/shared/feed-back/flush_bar.dart';
import 'package:rimlines/services/shared/feed-back/loader.dart';

Future<List<String>> signin(String username, String password) async {
  toggleLoading(state: true);
  FetcherResponse response = await FetchInspector().post(
    path: LOGIN_END_POINT,
    body: {
      'username': username,
      'password': password,
    },
  );
  if (response.status == 200) {
    // await FetchInspector().initialize();
    return ['Bearer ' + response.body['access'], response.body['access']];
  }
  print('No 200 :(');
  print(response.status);
  toggleLoading(state: false);
  showFlushBar(
    title: 'login.messages.error-title'.tr(),
    message: response.message ?? '',
  );

  return null;
}
