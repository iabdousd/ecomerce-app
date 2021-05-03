import 'package:bloc/bloc.dart';
import 'package:rimlines/models/auth/auth_state.dart';
import 'package:rimlines/repositories/auth/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepository = AuthRepository();
  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Authorized) {
      yield state.copyWith(
        jwtToken: event.jwtToken,
        refreshToken: event.refreshToken,
        loading: true,
      );
      final user = await _authRepository.getUser();
      final balanceMap = await _authRepository.getBalance(user.id);
      yield state.copyWith(
        jwtToken: event.jwtToken,
        refreshToken: event.refreshToken,
        loading: false,
        user: user,
        balance: balanceMap['total'],
        transactionsCount: balanceMap['count'],
      );
    } else if (event is UnAuthorized) {
      yield state.copyWith(
        loading: true,
      );
      await _authRepository.disconnect();
      yield AuthState(
        loading: false,
      );
    }
  }
}
