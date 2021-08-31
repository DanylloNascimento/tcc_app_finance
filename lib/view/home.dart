import 'package:app_acoesfinancas/model/data.dart';
import 'package:app_acoesfinancas/view/resultView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red,
            title: Text(
              "Ações - Mercado Financeiro",
              style: TextStyle(color: Colors.black),
            ),
            actions: [],
          ),
          body: TabBarView(children: [
            FormExample(),
          ])),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "Ações - Mercado Financeiro",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final TextEditingController textFieldController = TextEditingController();

  String? _selectedSymbol;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration:
                    InputDecoration(labelText: 'Digite a ação financeira'),
                controller: this._typeAheadController,
              ),
              suggestionsCallback: (pattern) {
                return SymbolService.getSuggestions(pattern);
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (String suggestion) {
                this._typeAheadController.text = suggestion;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Selecione o Symbol' : null,
              onSaved: (value) => this._selectedSymbol = value,
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Enviar'),
              onPressed: () {
                if (this._formKey.currentState!.validate()) {
                  this._formKey.currentState!.save();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultView(
                          text: _selectedSymbol.toString(),
                          key: null,
                        ),
                      ));
                }
              },
            ),
            SizedBox(
              height: 150.0,
            ),
          ],
        ),
      ),
    );
  }

  void _enviar(BuildContext context) {
    String textToSend = textFieldController.text;
  }
}

criaTabela() {
  return Table(
    defaultColumnWidth: FixedColumnWidth(150.0),
    border: TableBorder(
      horizontalInside: BorderSide(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 1.0,
      ),
      verticalInside: BorderSide(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 1.0,
      ),
    ),
    children: [
      _criarLinhaTable("Pontos, Time, Gols"),
      _criarLinhaTable("25, Palmeiras,16 "),
      _criarLinhaTable("20, Santos, 5"),
      _criarLinhaTable("17, Flamento, 6"),
    ],
  );
}

_criarLinhaTable(String listaNomes) {
  return TableRow(
    children: listaNomes.split(',').map((name) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(fontSize: 20.0),
        ),
        padding: EdgeInsets.all(8.0),
      );
    }).toList(),
  );
}
