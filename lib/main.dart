import 'package:flutter/cupertino.dart';
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
  TextEditingController _controllerCep = TextEditingController();

  String _resultado = "Resultado";

  _recuperarCep() async {
    String cepDigitado = _controllerCep.text;
    String url = "https://viacep.com.br/ws/${cepDigitado}/json/";

    Response response;
    //requisição assincrona
    response = await get(url);
    //decodifica o json e armazena em um Map
    Map<String, dynamic> retorno = json.decode(response.body);
    String log = retorno["logradouro"];
    String compl = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    if(retorno != null){
      setState(() {
        _resultado = "${log}, ${compl}, ${bairro}, ${localidade}";
      });
    }



    //print("resposta: " + response.statusCode.toString());
    print("resposta: " + response.body);
    print(log + " " + compl + " - " + bairro + " - " + localidade);
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
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Digite seu cep: ex.: 12345000"),
              style: TextStyle(fontSize: 20),
              controller: _controllerCep,
            ),
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
