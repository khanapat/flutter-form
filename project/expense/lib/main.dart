import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:expense/widgets/transaction_new.dart';
import 'package:flutter/material.dart';

// ใช้แทนกันได้
// void main() => runApp(MainApp());
void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New Trust', amount: 434.94, date: DateTime.now()),
    Transaction(id: 't2', title: 'New BoBo', amount: 12.28, date: DateTime.now()),
  ];

  void addTransaction({@required String title, @required double amount}) {
    // statefull ให้รู้วา transaction มีการเปลี่ยนแปลง
    setState(() {
      transactions.add(Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Expense App')),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CHART'),
                TransactionNew(addTransaction),
                TransactionList(transactions),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
