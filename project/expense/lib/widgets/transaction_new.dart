import 'package:flutter/material.dart';

class TransactionNew extends StatelessWidget {
  // String title;
  // String amount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // function constructor
  final void Function({@required String title, @required double amount}) addTransaction;

  TransactionNew(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            // เมื่อมีการเปลี่ยนค่าใน text จะเอาค่ามาใส่ในตัวแปร
            // onChanged: (value) => title = value,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            // onChanged: (value) => amount = value,
          ),
          TextButton(
            // onPressed: () => print('$title, $amount'),
            // onPressed: () => print('${titleController.text}, ${amountController.text}'),
            onPressed: () => addTransaction(title: titleController.text, amount: double.parse(amountController.text)),
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ),
          )
        ],
      ),
    );
  }
}
