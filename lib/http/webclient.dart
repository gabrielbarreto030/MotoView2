import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:motovibe/model/DadosSalvos.dart';
import 'package:motovibe/model/cliente.dart';

List<DadosSalvos> listapega=new List();
String URLhttp = "https://api.myjson.com/bins/ugrba";
final Client cliente =
    HttpClientWithInterceptor.build(interceptors: [LogginInterceptor()]);

class LogginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data);
    return data;
  }
}

Future<List<DadosSalvos>> findAll() async {
  final Response response = await cliente.get(URLhttp).timeout(Duration(seconds: 5)).catchError((error)=> print("null"));
   
  
  final List<dynamic> jsondecoded = jsonDecode(response.body);
  final List<DadosSalvos> clientes = List();
  for (Map<String, dynamic> element in jsondecoded) {
    final DadosSalvos itemcliente = DadosSalvos(
        element["modelo"], element["valor"], element["data"], element["hora"]);
    clientes.add(itemcliente);
  }
  listapega=clientes;
  return clientes;
}

Future<List<DadosSalvos>> savaAgenda(DadosSalvos salvandodado) async {
  final Map<String, dynamic> jsonDado = {
    
    "modelo": salvandodado.modelo,
    "valor": salvandodado.valor,
    "data": salvandodado.data,
    "hora": salvandodado.hora,
     
  };
  
 
 
  final String dadoJsonConvertido = "["+jsonEncode(jsonDado)+"]";

 final Response response =await cliente.put(URLhttp,headers: {"Content-type":"application/json"},body:dadoJsonConvertido).catchError((error)=> print("null"));

 // final Response response = await cliente.post(URLhttp,
   //   headers: {"Content-type": "application/json"}, body: dadoJsonConvertido);
   final List<DadosSalvos> clientes = List();

  List<dynamic> jsonfeito = jsonDecode(response.body);

  for (Map<String, dynamic> element in jsonfeito) {
    final DadosSalvos itemcliente = DadosSalvos(
        element["modelo"], element["valor"], element["data"], element["hora"]);
    clientes.add(itemcliente);
  }

  return clientes;
}
