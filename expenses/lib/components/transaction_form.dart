// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final void Function(String, double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

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
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: "Título",
              ),
            ),
            TextField(
              controller: valueController,
              onSubmitted: (_) =>
                  _submitForm(), //Quando um parâmetro recebido na função não é usado, por convensão, usar o _
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), //Funciona no IOS e no Android
              decoration: InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text("Nova Transação"),
                  onPressed: _submitForm,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
