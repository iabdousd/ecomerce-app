import 'package:bloc/bloc.dart';
import 'package:rimlines/bloc/auth/auth_bloc.dart';
import 'package:rimlines/constants/transactions/transactions.dart';
import 'package:rimlines/models/transaction/transaction_state.dart';
import 'package:rimlines/repositories/transaction/transaction_repository.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final _repositoryTransaction = TransactionRepository();
  final AuthBloc authBloc;
  TransactionBloc(this.authBloc)
      : super(TransactionState(
          loading: false,
          hasError: false,
          reachedLimit: false,
          transactions: [],
        ));

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is FetchedTransactions) {
      yield state.copyWith(
        loading: true,
      );
      final transactions = await _repositoryTransaction.getTransactions(
        authBloc.state.user.id,
        DEFAULT_TRANSACTIONS_PAGE_SIZE,
        null,
      );

      yield state.copyWith(
        loading: false,
        transactions: transactions,
      );
    } else if (event is FetchedMoreTransactions) {
      yield state.copyWith(
        loading: true,
      );
      final transactions = await _repositoryTransaction.getTransactions(
        authBloc.state.user.id,
        DEFAULT_TRANSACTIONS_PAGE_SIZE,
        state.transactions.length,
      );

      yield state.copyWith(
        loading: false,
        transactions: [...state.transactions, ...transactions],
        reachedLimit: transactions.length < DEFAULT_TRANSACTIONS_PAGE_SIZE,
      );
    }
  }
}
