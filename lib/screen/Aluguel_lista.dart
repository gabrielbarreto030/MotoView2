
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AluguelMotos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateAluguelMotos();
  }

}
class StateAluguelMotos extends State<AluguelMotos>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Alugar Moto"),
      ),

      body: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 400,
            height: 200,
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment(1.0,1.2),
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage("image/Yamaha_YZF.jpg"),
               fit:BoxFit.fitWidth,

            ),
            ),
            child: Text("YAMAHA YZF",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),textAlign: TextAlign.right,)
          ),
        ),

      )

    );
  }

}