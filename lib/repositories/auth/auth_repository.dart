import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rimlines/models/user/user.dart';
import 'package:rimlines/providers/auth/auth_provider.dart';

class AuthRepository {
  final _authProvider = AuthProvider();

  Future<User> getUser() async {
    final userRaw = await _authProvider.fetchUser();
    return userRaw != null ? User.fromJson(userRaw) : userRaw;
  }

  Future<Map> getBalance(int id) async {
    final balanceRaw = await _authProvider.fetchBalance(id);
    return balanceRaw;
  }

  Future<void> disconnect() async {
    final storage = new FlutterSecureStorage();
    await storage.deleteAll();
  }
}
