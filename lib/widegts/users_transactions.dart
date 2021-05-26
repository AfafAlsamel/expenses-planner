import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transactions.dart';

class UsersTransactions extends StatefulWidget {
  @override
  _UsersTransactionsState createState() => _UsersTransactionsState();
}

class _UsersTransactionsState extends State<UsersTransactions> {
  final List<Transaction> _userTransactoins = [
    Transaction(
      id: 't1',
      title: 'new bag',
      amount: 56.4,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'new sunglasses',
      amount: 46.4,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String titleTx, double amountTx) {
    final newTx = Transaction(
      title: titleTx,
      amount: amountTx,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactoins.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactoins),
      ],
    );
  }
}
