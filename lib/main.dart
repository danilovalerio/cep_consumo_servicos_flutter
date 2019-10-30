import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(MaterialApp(
  home: TelaPrincipal(),
  debugShowCheckedModeBanner: false,

));

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  _recuperarCep() async {
    String cep = "02840080";
    String url = "https://viacep.com.br/ws/${cep}/json/";

    Response response;

    response = await get(url);

    print("resposta: " + response.statusCode.toString());
    print("resposta: " + response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 185, 20, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 169, 75, 0.7),
        title: Text("CEP - consumo de API"),

      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            )
          ],
        ),
      ),
    );
  }
}

