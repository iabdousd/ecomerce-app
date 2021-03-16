class Transaction {
  int id;
  String title;
  double amount;
  DateTime date;
  String type;
  String customer;

  Transaction({
    this.id,
    this.title,
    this.amount,
    this.date,
    this.type,
    this.customer,
  });

  Transaction.fromJson(Map<String, dynamic> jsonObject) {
    this.id = int.parse(jsonObject['url']
        .toString()
        .split('/')[jsonObject['url'].toString().split('/').length - 2]);
    this.title = jsonObject['title'] ?? '';
    this.amount = jsonObject['amount'];
    this.date = DateTime.parse(jsonObject['date']);
    this.type = jsonObject['type'];
    this.customer = jsonObject['customer'];
  }
}
