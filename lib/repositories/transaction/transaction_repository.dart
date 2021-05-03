import 'package:rimlines/models/transaction/transaction.dart';
import 'package:rimlines/providers/transaction/transaction_provider.dart';

class TransactionRepository {
  final _transactionProvider = TransactionProvider();

  Future<List<Transaction>> getTransactions(
      int userid, int limit, int offset) async {
    final transactionsRaw =
        await _transactionProvider.fetchTransactions(userid, limit, offset);

    return transactionsRaw
        .map(
          (e) => Transaction.fromJson(e),
        )
        .toList();
  }
}
