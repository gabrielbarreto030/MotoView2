import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AluguelMotos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateAluguelMotos();
  }
}

class StateAluguelMotos extends State<AluguelMotos> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Alugar Moto"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                width: 400,
                height: 300,
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment(0.8, 1.0),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage("image/Yamaha_YZF.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  "YAMAHA",
                  style: TextStyle(
                    fontWeight:FontWeight.bold ,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1.0, 0.4),
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.only(top: 80),
                child: Row(children: [
                  Expanded(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.navigate_before),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.red,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.check),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.navigate_next),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      //Text("YAMAHA YZF",style: TextStyle(
      //fontWeight: FontWeight.bold,
      //fontSize: 20,
      //),textAlign: TextAlign.right,)
    );
  }
}
