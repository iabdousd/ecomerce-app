class Transaction {
  int id;
  String title;
  double amount;
  DateTime date;
  String type;
  int customer;

  Transaction({
    this.id,
    this.title,
    this.amount,
    this.date,
    this.type,
    this.customer,
  });

  Transaction.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'] ?? '';
    this.amount = jsonObject['amount'];
    this.date = DateTime.parse(jsonObject['date']);
    this.type = jsonObject['type'];
    this.customer = jsonObject['customer'];
  }
}
