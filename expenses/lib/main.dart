// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}

class MyHomePage extends StatelessWidget {
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
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Despesas Pessoais")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Card(
            child: Text('Gráfico'),
            elevation: 5,
            color: Colors.blue,
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        Text(
                            DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                                .format(tr.date),
                            style: const TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    // ignore: prefer_const_constructors
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Título",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Valor (R\$)",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: null,
                            child: Text(
                              "Nova Transação",
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
