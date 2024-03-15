import 'package:flutter/material.dart';

class SpendHistoryPage extends StatefulWidget {
  @override
  _SpendHistoryPageState createState() => _SpendHistoryPageState();
}

class _SpendHistoryPageState extends State<SpendHistoryPage> {
  List<Transaction> _transactions = [
    Transaction(
        amount: 100,
        type: TransactionType.credit,
        date: DateTime.now(),
        category:
            TransactionCategory(icon: Icons.shopping_cart, name: "Shopping")),
    Transaction(
        amount: 50,
        type: TransactionType.debit,
        date: DateTime.now(),
        category: TransactionCategory(icon: Icons.fastfood, name: "Food")),
    Transaction(
        amount: 200,
        type: TransactionType.credit,
        date: DateTime.now(),
        category: TransactionCategory(icon: Icons.home, name: "Rent")),
    Transaction(
        amount: 70,
        type: TransactionType.debit,
        date: DateTime.now(),
        category:
            TransactionCategory(icon: Icons.local_hospital, name: "Medical")),
    Transaction(
        amount: 150,
        type: TransactionType.credit,
        date: DateTime.now(),
        category:
            TransactionCategory(icon: Icons.directions_car, name: "Transport")),
  ];

  List<Transaction> _filteredTransactions = [];

  bool _sortByDateAscending = true;

  @override
  void initState() {
    super.initState();
    _filteredTransactions.addAll(_transactions);
  }

  void _filterTransactions(TransactionType type) {
    setState(() {
      _filteredTransactions.clear();
      _filteredTransactions.addAll(
        _transactions.where((transaction) => transaction.type == type),
      );
    });
  }

  void _sortTransactionsByDate() {
    setState(() {
      if (_sortByDateAscending) {
        _filteredTransactions.sort((a, b) => a.date.compareTo(b.date));
      } else {
        _filteredTransactions.sort((a, b) => b.date.compareTo(a.date));
      }
      _sortByDateAscending = !_sortByDateAscending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spend History'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: _sortTransactionsByDate,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _filterTransactions(TransactionType.credit),
                child: Text('Credited'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => _filterTransactions(TransactionType.debit),
                child: Text('Debited'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = _filteredTransactions[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Card(
                    elevation: 4,
                    color: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        transaction.type == TransactionType.credit
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        color: transaction.type == TransactionType.credit
                            ? Colors.lightGreen
                            : Colors.red,
                      ),
                      title: Text(
                        '${transaction.type == TransactionType.credit ? 'Credited' : 'Debited'}: \$${transaction.amount}',
                        style: TextStyle(
                          color: transaction.type == TransactionType.credit
                              ? Colors.lightGreen
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${transaction.date}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      trailing: Icon(
                        transaction.category.icon,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum TransactionType { credit, debit }

class Transaction {
  final double amount;
  final TransactionType type;
  final DateTime date;
  final TransactionCategory category;

  Transaction({
    required this.amount,
    required this.type,
    required this.date,
    required this.category,
  });
}

class TransactionCategory {
  final IconData icon;
  final String name;

  TransactionCategory({required this.icon, required this.name});
}

void main() {
  runApp(MaterialApp(
    home: SpendHistoryPage(),
  ));
}
