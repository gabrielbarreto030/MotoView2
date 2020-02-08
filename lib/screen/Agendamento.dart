import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class Agendamento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateAgendamento();
  }
}

class Horario{
  int id;
  String hora;

  Horario(this.id,this.hora);

  static List<Horario> getHorario (){
    return <Horario>[
      Horario(1,"07:00"),
      Horario(1,"08:00"),
      Horario(1,"09:00"),
      Horario(1,"10:00"),
      Horario(1,"11:00"),
      Horario(1,"12:00"),
      Horario(1,"13:00"),
      Horario(1,"14:00"),
      Horario(1,"15:00"),
      Horario(1,"16:00"),
      Horario(1,"17:00"),
      Horario(1,"18:00"),
      Horario(1,"19:00"),
      ];
  }
}

class StateAgendamento extends State<Agendamento>{
   DateTime _date=DateTime.now();//Pegar Data Atual

   String datafeita;
  
   List<Horario> _horarios=Horario.getHorario();//Instacia Classe Horario e Pega Lista
   List<DropdownMenuItem<Horario>> _dropdownhorarios;//Variavel que os Horarios vão transformar em DropDownItens
   Horario _selectedHorario;//Hora Selecionada 
   
   @override
   void initState(){
     _dropdownhorarios=Builddrophorarios(_horarios);//Tranforma em DropDown Lista de Horas
     _selectedHorario=_dropdownhorarios[0].value;//Seleciona 1ºhora como Hora Inicial
     datafeita=formatDate(_date, [dd, '-', mm, '-', yyyy]);
     super.initState();
   }

   List<DropdownMenuItem<Horario>> Builddrophorarios(List horarios){
       List<DropdownMenuItem<Horario>> horas = List();

       for(Horario hora in horarios){
         horas.add(DropdownMenuItem(value: hora,child: Text(hora.hora)));
       }
       return horas;
   }

  //String datafeita=formatDate(_date, [yyyy, '-', mm, '-', dd]).toString();

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
          datafeita=formatDate(_date, [dd, '-', mm, '-', yyyy]);
        });
      }
    }
    ChangedHorario(Horario selectHoraio){
        setState(() {
          _selectedHorario=selectHoraio;
        });
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
        Container(
          child: Column(children: <Widget>[
            Text("Horario"),
            DropdownButton(
              value: _selectedHorario,
              items: _dropdownhorarios, onChanged: ChangedHorario),
            SizedBox(height: 40.0),
            Text("Dia:${datafeita} Hora:${_selectedHorario.hora}")


          ],),
        )
        ]
      ),

    );
  }

}