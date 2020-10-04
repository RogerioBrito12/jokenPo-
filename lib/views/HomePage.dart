import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });

        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaApp == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabens!!! Voce ganhou";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Voce Perdeu tente outra vez";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "JokemPo",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 10),
              child: Text(
                "Escolha do app",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Image(
              image: this._imagemApp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 10),
              child: Text(
                this._mensagem,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset("images/pedra.png", height: 100),
                  onTap: () => _opcaoSelecionada("pedra"),
                ),
                GestureDetector(
                  child: Image.asset("images/papel.png", height: 100),
                  onTap: () => _opcaoSelecionada("papel"),
                ),
                GestureDetector(
                  child: Image.asset("images/tesoura.png", height: 100),
                  onTap: () => _opcaoSelecionada("tesoura"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
