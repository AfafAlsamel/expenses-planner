import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  submittedTx() {
    final titleOfTx = titleController.text;
    final amountOfTx = double.parse(amountController.text);

    if (titleOfTx.isEmpty || amountOfTx <= 0) {
      return;
    }

    widget.addNewTransaction(
      titleController.text,
      double.parse(
        amountController.text,
      ),
      
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Tilte'),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submittedTx(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submittedTx(),
            ),
            FlatButton(
              onPressed: submittedTx,
              child: Text('Save'),
              textColor: Colors.purple[900],
            ),
          ],
        ),
      ),
    );
  }
}
