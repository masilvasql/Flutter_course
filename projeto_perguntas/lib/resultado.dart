import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(
      {Key? key,
      required this.pontuacao,
      required this.quandoReiniciarQuestionario})
      : super(key: key);

  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Você é bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          fraseResultado,
          style: const TextStyle(fontSize: 28),
        )),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar',
            style: TextStyle(
              fontSize: 18,
              color: Colors.lightBlue,
            ),
          ),
        )
      ],
    );
  }
}
