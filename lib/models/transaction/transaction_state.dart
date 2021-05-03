import 'package:rimlines/models/transaction/transaction.dart';

class TransactionState {
  bool loading;
  List<Transaction> transactions;
  bool hasError;
  bool reachedLimit;
  String errorText;

  TransactionState({
    this.loading,
    this.transactions,
    this.hasError,
    this.errorText,
    this.reachedLimit,
  });

  TransactionState copyWith({
    bool loading,
    List<Transaction> transactions,
    bool hasError,
    String errorText,
    bool reachedLimit,
  }) {
    return TransactionState(
      loading: loading ?? this.loading,
      transactions: transactions ?? this.transactions,
      hasError: hasError ?? this.hasError,
      errorText: errorText ?? this.errorText,
      reachedLimit: reachedLimit ?? this.reachedLimit,
    );
  }
}

abstract class TransactionEvent {}

class FetchedTransactions extends TransactionEvent {}

class FetchedMoreTransactions extends TransactionEvent {}
