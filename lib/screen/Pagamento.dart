import 'package:flutter/material.dart';
import 'package:motovibe/screen/Agendamento.dart';
import 'package:motovibe/screen/Boleto.dart';
import 'package:motovibe/screen/CreditCart.dart';

class Pagamento extends StatefulWidget {
  final String modelo;
  final int total;
  final String data;
  final String hora;
  final String local;
  Pagamento(this.modelo,this.total,this.data,this.hora,this.local);
  @override
  _Pagamento createState() => _Pagamento(modelo,total,data,hora,local);
}

class _Pagamento extends State<Pagamento>{
  final String modelo;
  final int total;
  final String data;
  final String hora;
  final String local;
  _Pagamento(this.modelo,this.total,this.data,this.hora,this.local);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Pagamento")),
      body: SingleChildScrollView(
              child: Column(children: <Widget>[
          Text("Geral",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
          Row(children: <Widget>[Expanded(child: Text("Modelo:",textAlign:TextAlign.end)),
          Expanded(child: Text("$modelo",textAlign:TextAlign.start))
          ],),
          Row(children: <Widget>[Expanded(child: Text("Valor Total:",textAlign:TextAlign.end)),
          Expanded(child: Text("$total",textAlign:TextAlign.start))
          ],),
          Row(children: <Widget>[Expanded(child: Text("Data:",textAlign:TextAlign.end)),
          Expanded(child: Text("$data",textAlign:TextAlign.start))
          ],),
          Row(children: <Widget>[Expanded(child: Text("Horario:",textAlign:TextAlign.end)),
          Expanded(child: Text("$hora",textAlign:TextAlign.start))
          ],),
          Row(children: <Widget>[Expanded(child: Text("Local:",textAlign:TextAlign.end)),
          Expanded(child: Text("$local",textAlign:TextAlign.start))
          ],),
          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BoletoBancario()));
          },child:Text("Boleto")),
          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreditCardPage()));
          },child:Text("Cartã de Crédito"))
          

        ],),
      ),
    );
  }
}