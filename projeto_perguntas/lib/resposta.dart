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
            primary: Colors.lightBlueAccent,
            elevation: 5,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
