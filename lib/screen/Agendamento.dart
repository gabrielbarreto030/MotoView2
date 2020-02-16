import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'Pagamento.dart';

class Agendamento extends StatefulWidget {
  final String modelMoto;
  final double precoMoto;
  final double acessoMoto;
  const Agendamento(this.modelMoto, this.precoMoto, this.acessoMoto);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateAgendamento(modelMoto, precoMoto, acessoMoto);
  }
}

class Horario {
  int id;
  String hora;

  Horario(this.id, this.hora);

  static List<Horario> getHorario() {
    return <Horario>[
      Horario(1, "07:00"),
      Horario(1, "08:00"),
      Horario(1, "09:00"),
      Horario(1, "10:00"),
      Horario(1, "11:00"),
      Horario(1, "12:00"),
      Horario(1, "13:00"),
      Horario(1, "14:00"),
      Horario(1, "15:00"),
      Horario(1, "16:00"),
      Horario(1, "17:00"),
      Horario(1, "18:00"),
      Horario(1, "19:00"),
    ];
  }
}

class StateAgendamento extends State<Agendamento> {
  final String modelMoto;
  final double precoMoto;
  final double acessoMoto;
  StateAgendamento(this.modelMoto, this.precoMoto, this.acessoMoto);
  DateTime _date = DateTime.now(); //Pegar Data Atual

  String datafeita;

  List<Horario> _horarios =
      Horario.getHorario(); //Instacia Classe Horario e Pega Lista
  List<DropdownMenuItem<Horario>>
      _dropdownhorarios; //Variavel que os Horarios vão transformar em DropDownItens
  Horario selectedHorario; //Hora Selecionada

  //int local=1; //grupo de Localidades
  String localSelecionado = "BarraFunda/SP"; //Local Selecionado

  @override
  void initState() {
    _dropdownhorarios =
        Builddrophorarios(_horarios); //Tranforma em DropDown Lista de Horas
    selectedHorario =
        _dropdownhorarios[0].value; //Seleciona 1ºhora como Hora Inicial
    datafeita = formatDate(_date, [dd, '/', mm, '/', yyyy]); //Inicia Data
    super.initState();
  }

  List<DropdownMenuItem<Horario>> Builddrophorarios(List horarios) {
    List<DropdownMenuItem<Horario>> horas = List();

    for (Horario hora in horarios) {
      horas.add(DropdownMenuItem(value: hora, child: Text(hora.hora)));
    }
    return horas;
  }

  Future<Null> FazData(BuildContext context) async {
    final DateTime DataClick = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));

    if (DataClick != null && DataClick != _date) {
      setState(() {
        _date = DataClick;
        datafeita = formatDate(_date, [dd, '/', mm, '/', yyyy]);
      });
    }
  }

  ChangedHorario(Horario selectHoraio) {
    setState(() {
      selectedHorario = selectHoraio;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double totalAll= precoMoto+acessoMoto;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Reserva"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text("Modelo",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900))),
                      Expanded(
                        child: Text("Valor",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.end),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(modelMoto)),
                      Expanded(
                          child: Text(precoMoto.toString(),
                              textAlign: TextAlign.end))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Acessorios")),
                      Expanded(
                          child: Text(acessoMoto.toString(),
                              textAlign: TextAlign.end))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Text(
                      "Total:$totalAll",
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                    )),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: <Widget>[
              Expanded(child: Text("Dia:$datafeita")),
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    FazData(context);
                  },
                  child:
                      Text('Selecionar Data', style: TextStyle(fontSize: 10)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text("Horario:")),
              Expanded(
                child: DropdownButton(
                    value: selectedHorario,
                    items: _dropdownhorarios,
                    onChanged: ChangedHorario),
              ),
            ],
          ),
          Text(
            "Loja",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Radio(
                    value: "BarraFunda/SP",
                    groupValue: localSelecionado,
                    onChanged: (value) {
                      setState(() {
                        localSelecionado = "BarraFunda/SP";
                      });
                    }),
                Text("BarraFunda/SP"),
              ]),
              Row(children: <Widget>[
                Radio(
                    value: "Mogi Das Cruzes",
                    groupValue: localSelecionado,
                    onChanged: (value) {
                      setState(() {
                        localSelecionado = "Mogi Das Cruzes";
                      });
                    }),
                Text("Mogi Das Cruzes"),
              ]),
              Row(children: <Widget>[
                Radio(
                    value: "Sorocaba/SP",
                    groupValue: localSelecionado,
                    onChanged: (value) {
                      setState(() {
                        localSelecionado = "Sorocaba/SP";
                      });
                    }),
                Text("Sorocaba/SP")
              ])
            ]),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () {//modelMoto,totalAll ,datafeita,_selecthorario,localselecionado
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pagamento(modelMoto,totalAll ,datafeita,selectedHorario.hora,localSelecionado)));
                  },
                  child: Text("Continuar"),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
