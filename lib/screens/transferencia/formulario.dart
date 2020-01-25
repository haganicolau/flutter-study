import 'package:cert_mobile/components/editor.dart';
import 'package:cert_mobile/modules/Transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _TITULO_APP_BAR = 'Criando Transferência';
const _ROTULO_CAMPO_VALOR = "Valor";
const _DICA_CAMPO_VALOR = "00.00";
const _ROLUTO_CAMPO_NUMERO_CONTA = "Número Conta";
const _DICA_CAMPO_NUMERO_CONTA = "0000";
const _ROTULO_BUTTON_CONFIRMAR = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(_TITULO_APP_BAR),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _ROLUTO_CAMPO_NUMERO_CONTA,
                dica: _DICA_CAMPO_NUMERO_CONTA,
              ),
              Editor(
                controlador: _controladorCampoValor,
                rotulo: _ROTULO_CAMPO_VALOR,
                dica: _DICA_CAMPO_VALOR,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_ROTULO_BUTTON_CONFIRMAR),
                onPressed: () => _criarTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void _criarTransferencia(context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
