import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motovibe/screen/Aluguel_lista.dart';
import 'package:motovibe/screen/meusagendamentos.dart';

class Inicio extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MotoView"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AluguelMotos()));
              },
              child: Container(
                alignment: Alignment(-1.0,1.0),
                width: 200,
                height: 150,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("image/motos.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                )),
                child: Text("Alugar motos",textAlign: TextAlign.start,style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),

            //child:
          ),
          Card(
            
            margin: EdgeInsets.all(15),
            child: GestureDetector(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MeusAgendamentos()));
              } ,
                          child: Container(
                alignment: Alignment(-1.0,1.0),
                width: 200,
                height: 150,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("image/motos_agendamentos.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    )),
                child: Text("Meus Agendamentos",textAlign: TextAlign.start,style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),

            //child:
          )
        ],
      ),
    );
  }
}
