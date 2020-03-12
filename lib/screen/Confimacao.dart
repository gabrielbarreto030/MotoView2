import 'package:flutter/material.dart';
import 'package:motovibe/bancodedados/dao.dart';
import 'package:motovibe/model/DadosSalvos.dart';
import 'package:motovibe/model/Moto.dart';
import 'package:motovibe/screen/Agendamento.dart';
import 'package:motovibe/screen/Boleto.dart';
import 'package:motovibe/screen/CreditCart.dart';
import 'package:motovibe/screen/Inicio.dart';

class Confirma extends StatefulWidget {
  final String modelo;
  final double total;
  final String data;
  final String hora;
  final String local;
  Confirma(this.modelo,this.total,this.data,this.hora,this.local);
  @override
  _Pagamento createState() => _Pagamento(modelo,total,data,hora,local);
}

class _Pagamento extends State<Confirma>{
  final String modelo;
  final double total;
  final String data;
  final String hora;
  final String local;
  final bool pagEnviado=false;
  var pagSelecionado="";
  final String card="Cartão de Crédito";
  final String boleto="Boleto";
   
  
  _Pagamento(this.modelo,this.total,this.data,this.hora,this.local);

   @override
  void initState() {
    ValidaPagamento();
    super.initState();
  }
  
   @override
  Widget build(BuildContext context) {
    final MotoDao dao= MotoDao();
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
          Row(children: <Widget>[Expanded(child: Text("Pagamento:",textAlign:TextAlign.end)),
          Expanded(child: Text("$pagSelecionado",textAlign:TextAlign.start))
          ],),
          RaisedButton(onPressed: (){
            dao.Salva(DadosSalvos("$modelo",total,"$data","$hora")).then((id)=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Inicio())));
            
          },child:Text("Confirmar Agendamento"))
          

        ],),
      ),
    );
  }
  void ValidaPagamento(){
    if(pagEnviado==true){
       pagSelecionado=card;
    }
    else{
     pagSelecionado=boleto;
    }
  }
}