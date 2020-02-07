import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateAgendamento();
  }
}


class StateAgendamento extends State<Agendamento>{
   DateTime _date=DateTime.now();  

   Future<Null> FazData(BuildContext context) async {
      final DateTime DataClick= await showDatePicker(
        context: context,
        initialDate:_date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)
      );
      if(DataClick !=null && DataClick!=_date){
        setState(() {
          _date=DataClick;
          print(_date.toString());
        });
      }
    }
  @override
  Widget build(BuildContext context) {
   
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:Text("Reserva"),
      ),
      body: Column(
        children:<Widget>[
            RaisedButton(
          onPressed: (){
            FazData(context);

          },
          child: Text(
            'Selecionar Data',
            style: TextStyle(fontSize: 20)
          ),
        ),
        ]
      ),

    );
  }

}