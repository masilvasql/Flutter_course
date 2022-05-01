import 'dart:math';

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Notebook',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta 4',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta 5',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta 6',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'Conta 7',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTranscation(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(onSubmit: _addTranscation),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
