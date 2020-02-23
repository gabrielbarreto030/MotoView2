import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';

class CreditCardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateCredidCard();
  }
}

class StateCredidCard extends State<CreditCardPage> {
  String nomeC = "xxx";
  var numberControl=new MaskedTextController(mask:"0000 0000 0000 0000");
  String numCartC = "0000 0000 0000 0000";
  String dataC = "mm/YY";
  var dataVenControl = new MaskedTextController(mask: '00/00');
  String cvvC="000";
  double height = 300;
  double width = 500;
  bool showBackOfCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});
        },
        icon: Icon(Icons.payment),
        label: Text("Confirmar"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              alignment: Alignment.center,
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.all(10),
              width: width,
              height: height,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showBackOfCard = !showBackOfCard;
                  });
                },
                child: Container(
                  child: CreditCardWidget(
                    cardNumber: numCartC,
                    expiryDate: dataC,
                    cardHolderName: nomeC,
                    cvvCode: cvvC,
                    showBackView: showBackOfCard,
                    cardbgColor: Colors.blue,
                    height: 175,
                    textStyle: TextStyle(color: Colors.black),
                    animationDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(30),
              height: 650,
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextField(
                      maxLength: 20,
                      onChanged: (String value) {
                        setState(() {
                          nomeC = value;
                        });
                      },
                      decoration: InputDecoration(labelText: "Nome Completo")),
                  TextField(
                    keyboardType: TextInputType.number,
                      maxLength: 19,
                      controller: numberControl,
                      onChanged: (String value) {
                        setState(() {
                          numCartC = value;
                        });
                      },
                      decoration:
                          InputDecoration(labelText: "Numero do Cartão")),
                  TextField(
                      controller: dataVenControl,
                      onChanged: (String value) {
                        setState(() {
                          dataC = value;
                        });
                      },
                      maxLength: 5,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(labelText: "MM/YY")),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: TextField(
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                        setState(() {
                          cvvC = value;
                        });
                      },
                        decoration: InputDecoration(labelText: "CVV")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
