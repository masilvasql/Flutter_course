import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta({
    Key? key,
    required this.texto,
    required this.quandoSelecionado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(color: Colors.red)),
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
