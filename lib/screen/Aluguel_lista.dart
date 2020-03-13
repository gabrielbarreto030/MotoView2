import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motovibe/model/Moto.dart';
import 'package:motovibe/screen/Agendamento.dart';

class AluguelMotos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateAluguelMotos();
  }
}

bool Atcap = false;

bool Atroupa = false;

int i = 0;
bool buttonenable;

class StateAluguelMotos extends State<AluguelMotos> {
  List<Moto> listamoto = new List();
  void AtivaBotao() {
    setState(() {
      if (i == 0) {
        i = 2;
      } else {
        i--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int Capacete = 50;
    int Roupa = 80;
    buttonenable = false;
    listamoto.add(Moto("image/Yamaha_YZF.jpg", "YAMAHA", 20));
    listamoto.add(Moto("image/Fireblade.jpeg", "FIREBLADE", 20));
    listamoto.add(Moto("image/Kawasaki.jpeg", "KAWASAKI", 30));
    
    int Total = listamoto[i].preco;
    int totalAcessorios= calculacapacete(Capacete)+calcularoupa(Roupa);
    Total=Total+calculacapacete(Capacete)+calcularoupa(Roupa);
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
            children: <Widget>[
              Container(
                width: 400,
                height: 250,
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
                    image: AssetImage(listamoto[i].imagem),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  "Modelo:${listamoto[i].nome} Valor:${listamoto[i].preco}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              BotaoSelect(listamoto[i].nome,listamoto[i].preco,totalAcessorios),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SwitchListTile(
                      value: Atcap,
                      onChanged: (bool value) {
                        setState(() {
                          Atcap = value;
                        });
                      },
                      title: Text("Capacete Extra R\$$Capacete"),
                      activeColor: Colors.redAccent,
                    ),
                    SwitchListTile(
                      value: Atroupa,
                      onChanged: (bool value) {
                        setState(() {
                          Atroupa = value;
                          if(Atroupa=true){

                          }else{
                            
                          }

                          
                        });
                      },
                      title: Text("Colete de Proteção R\$$Roupa"),
                      activeColor: Colors.redAccent,
                    ),
                    Card(
                      child: ListTile(
                        title: Text("Total:$Total"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int calculacapacete(int Capacete) {
    if (Atcap == true) {
      Capacete=50;
    } else {
      Capacete=0;
    }
    return Capacete;
  }

 int calcularoupa(int Roupa) {
    if (Atroupa == true) {
      Roupa=80;
    } else {
      Roupa=0;
    }
    return Roupa;
  }

  Container BotaoSelect(String motoEsc,int precoEsc, int acessoEsc) {
    
    return Container(
      alignment: Alignment(1.0, 0.1),
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
              onPressed: () {
                AtivaBotao();
              },
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
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Agendamento(motoEsc,precoEsc,acessoEsc)));
              },
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
              onPressed: () {
                setState(() {
                  i++;
                });
              },
            ),
          ),
        ),
      ]),
    );
  }
}
