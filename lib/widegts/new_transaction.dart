import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _datepickered;

  void _submittedTx() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final titleOfTx = titleController.text;
    final amountOfTx = double.parse(_amountController.text);

    if (titleOfTx.isEmpty || amountOfTx <= 0 || _datepickered == null) {
      return;
    }

    widget.addNewTransaction(
      titleOfTx,
      amountOfTx,
      _datepickered,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickeredDate) {
      if (pickeredDate == null) {
        return;
      }
      setState(() {
        _datepickered == pickeredDate;
      });
    });
    print('...');
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
              onSubmitted: (_) => _submittedTx(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submittedTx(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _datepickered == null
                          ? 'No selected date'
                          : 'Picked date: ${DateFormat.yMd().format(_datepickered)}',
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Choose date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submittedTx,
              child: Text('Save'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            ),
          ],
        ),
      ),
    );
  }
}
