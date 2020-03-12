


import 'package:flutter/material.dart';
import 'package:motovibe/components/progress.dart';
import 'package:motovibe/http/webclient.dart';
import 'package:motovibe/model/DadosSalvos.dart';

class HistoricoMotos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HistoricoMotos();
  }

}

class _HistoricoMotos extends State<HistoricoMotos>{
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Historico")),
        body: FutureBuilder<List<DadosSalvos>>(
            future: findAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                if(snapshot.hasData){
                  final List<DadosSalvos> dado = snapshot.data;
                  if (dado.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          children: List.generate(dado.length, (index) {
                        return controiAgendamentos(dado[index]);
                      })),
                    );
                  }

                }
                  
                  return Center(child: Text("Nenhum Agendamento Feito"));

                  break;
              }
              return Center(child: Text("Erro"));
            }));
  }

  Column montaAgendamentos(DadosSalvos itemlista) {
    return controiAgendamentos(itemlista);

    ;
  }

  Column controiAgendamentos(DadosSalvos dados) {
    return Column(
      children: <Widget>[
        Container(
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "Modelo:${dados.modelo}\n Valor:${dados.valor} \n Data:${dados.data}\n Hora:${dados.hora}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

}