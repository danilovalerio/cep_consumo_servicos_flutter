import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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
    //decodifica o json e armazena em um Map
    Map<String, dynamic> retorno = json.decode(response.body);
    String log = retorno["logradouro"];
    String compl = retorno["complemento"];
    String bairro = retorno["bairro"];


//    print("resposta: " + response.statusCode.toString());
    print("resposta: " + response.body);
    print(log+" "+compl+" - "+bairro);

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
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Clique aqui"),
                    onPressed: _recuperarCep,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

