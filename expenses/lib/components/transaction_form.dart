// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Título",
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      print(titleController.text);
                      print(valueController.text);
                    },
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
      ),
    );
  }
}
