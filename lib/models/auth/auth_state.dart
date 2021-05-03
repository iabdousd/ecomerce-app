import 'package:rimlines/models/user/user.dart';

class AuthState {
  bool loading;
  User user;
  String jwtToken;
  String refreshToken;
  double balance;
  int transactionsCount;

  AuthState({
    this.loading,
    this.user,
    this.jwtToken,
    this.refreshToken,
    this.balance,
    this.transactionsCount,
  });

  AuthState copyWith({
    bool loading,
    User user,
    String jwtToken,
    String refreshToken,
    double balance,
    int transactionsCount,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
      jwtToken: jwtToken ?? this.jwtToken,
      refreshToken: refreshToken ?? this.refreshToken,
      balance: balance ?? this.balance,
      transactionsCount: transactionsCount ?? this.transactionsCount,
    );
  }
}

abstract class AuthEvent {}

class Authorized extends AuthEvent {
  String jwtToken;
  String refreshToken;
  Authorized({
    this.jwtToken,
    this.refreshToken,
  });
}

class UnAuthorized extends AuthEvent {
  UnAuthorized();
}
